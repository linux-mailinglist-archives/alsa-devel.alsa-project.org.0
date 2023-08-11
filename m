Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EBA77932C
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 17:33:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F5D0208;
	Fri, 11 Aug 2023 17:32:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F5D0208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691768002;
	bh=c4lb8zN9J6W1LqHAWpZV6cy0r/dlZ2hnxiK71pL5iXs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=amW5vvswF9Fc0yBQby8He6Sz6w/4bzZtqWptzXEwQbzpkp733omZSjN0vyFTZPLJX
	 shJjtfTPIa1ShVPFAJiBMtVt/I7+vJ2tws2pYCUjkFEWT35bvcwEnY3FY68kqNQmjq
	 YnBpxWJzKd0mgeknDzeqSea8JFEPVsOfFSDcGd2M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C3CBF80134; Fri, 11 Aug 2023 17:32:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FA81F80134;
	Fri, 11 Aug 2023 17:32:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD519F80166; Fri, 11 Aug 2023 17:32:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 587DFF800EE;
	Fri, 11 Aug 2023 17:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 587DFF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D0nEG2BI
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8ECD40005;
	Fri, 11 Aug 2023 15:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691767936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=odiAeJE+wlZMfX2NdHWqS9fYoT/3pfEqK4fP0gA6bxI=;
	b=D0nEG2BI2Jq9wVG37EnOmy35e/0lXnivrpveFFbk5th5iFbxDn1eMmajjNgIQGl6DQCCj+
	7W1kvTKoA37a5536v+1o8PqspVcLBi0FVH2ppvLFx53eIH2JmlgTo7w2QFx4aIt2eAPyyS
	xQR30xTk3REdlehJ8zpIGseCNpjMs7p3dV8ILfI5LMjvwwVHLlui/R1D/rVAamoosXwwzD
	RNUD7GE5024jyqeDQRRb22JsHMfikcb4WJRhkoQedXPWf/5e+lUc7vEAigYtkeS56TNC4f
	5FtseK6P2LRiZT+wHv9wqdua+n2b7zafkWOn9PiciymlTxy1mXK7dURJ2JvrsQ==
Date: Fri, 11 Aug 2023 17:32:13 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <pierre-louis.bossart@linux.intel.com>,
 <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
 <ranjani.sridharan@linux.intel.com>, <daniel.baluta@nxp.com>,
 <kai.vehmanen@linux.intel.com>, <daniel.beer@igorinstitute.com>,
 <Jonathan.Cameron@huawei.com>, <luzmaximilian@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <alsa-devel@alsa-project.org>,
 <sound-open-firmware@alsa-project.org>
Subject: Re: [PATCH -next 2/2] ASoC: SOF: ipc3: Use devm_kmemdup to replace
 devm_kmalloc + memcpy
Message-ID: <20230811173213.5e21e555@booty>
In-Reply-To: <20230810114738.2103792-3-lizetao1@huawei.com>
References: <20230810114738.2103792-1-lizetao1@huawei.com>
	<20230810114738.2103792-3-lizetao1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
Message-ID-Hash: LBNWEUTDTZDQUFXE2U5MHAJ4ONADJNFN
X-Message-ID-Hash: LBNWEUTDTZDQUFXE2U5MHAJ4ONADJNFN
X-MailFrom: luca.ceresoli@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LBNWEUTDTZDQUFXE2U5MHAJ4ONADJNFN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 10 Aug 2023 19:47:38 +0800
Li Zetao <lizetao1@huawei.com> wrote:

> Use the helper function devm_kmemdup() rather than duplicating its
> implementation, which helps to enhance code readability.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
