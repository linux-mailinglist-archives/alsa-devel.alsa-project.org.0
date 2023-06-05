Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6927221BB
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 11:09:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89A091D6;
	Mon,  5 Jun 2023 11:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89A091D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685956156;
	bh=CuI2tVljCJg/uTnwW/xgr7RXJ/JrsJTuWbycO8jOShI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h5GoXagB2TdbiQ7StEi+lM/I6tyCWNQp2pA1p5zMj5vgu7iGJQ+U3UKe8UWt8DEuJ
	 RZp91RiJiZ05HyHPjyQ7awrUl2NI6duwJ+4N9aqM+5GcFHQJ+qrbIP8kajfCX8jYoQ
	 Kuz88Tq6/53k7sL62RHJnbU1SL11l5e+ZCvVaYao=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84CC0F80155; Mon,  5 Jun 2023 11:08:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F5D8F80155;
	Mon,  5 Jun 2023 11:08:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55B88F80199; Mon,  5 Jun 2023 11:07:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37F52F80155
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 11:07:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37F52F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mYZI5s+5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8E785611C5;
	Mon,  5 Jun 2023 09:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE45C433EF;
	Mon,  5 Jun 2023 09:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685956072;
	bh=CuI2tVljCJg/uTnwW/xgr7RXJ/JrsJTuWbycO8jOShI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mYZI5s+5qSa/ow2tsEjjY+EvhvbFWNyH9uXWC/Y4YNuD0G7fFI6rh/nPGTFW4WE/y
	 4K5acr+UcQr6LZqaWJOiusVBnruRQtDyxw8nRwCHrpobfyXlY8JelNHZy84oJPPVA9
	 u8haE7I8ii50L7ruCtWAqyyEEcQ0YAZhOWrKElkjB261/EZufh6c7LuwBuI7AEx0am
	 h5wfnmYmE+pndTQR3W9RwZrCxeONqh7sGhTckcWKINqEKZZgJ4pXrfPtpSplnQOAwz
	 wxSl/+C2TKMDsv95uplyvePxcsb29ErZtXJJaP2mw/KrDrM/Q0yAlFBynYIJ1cIouj
	 uOmK6+Hxzy/rQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1q66C9-0001TD-5M; Mon, 05 Jun 2023 11:08:09 +0200
Date: Mon, 5 Jun 2023 11:08:09 +0200
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: vkoul@kernel.org, andersson@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, sanyog.r.kale@intel.com,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] soundwire: qcom: stablity fixes
Message-ID: <ZH2l-UbMyLi5Uwph@hovoldconsulting.com>
References: <20230525133812.30841-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230525133812.30841-1-srinivas.kandagatla@linaro.org>
Message-ID-Hash: FJM2EWDUBTARXYHY7JHIHTVW7RLU2NC7
X-Message-ID-Hash: FJM2EWDUBTARXYHY7JHIHTVW7RLU2NC7
X-MailFrom: johan@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJM2EWDUBTARXYHY7JHIHTVW7RLU2NC7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 25, 2023 at 02:38:08PM +0100, Srinivas Kandagatla wrote:
> During x13s audio testing we hit few corner cases due to issues
> in codec drivers and some obvious code bugs.
> 
> Here are the fixes for those issues, mostly the issues are around
> devices loosing the sync in between runtime pm suspend resume path.
> 
> With codec fixes along with these fixes, audio on x13s is pretty stable.
> 
> Thanks,
> Srini
> 
> Changes since v1:
> 	- dropped runtime pm changes patch as unable to reproduced it anymore
> 	- fixed clk stop flag as suggested by Pierre
> 	- rebased on top of linux-next

I tried to update to this series on my 6.4-rc5 branch for the X13s and
the above changes appear to lead to breakages again.

Specifically, with the updated clk stop flag (simple_clk_stop_capable) I
see:

[   14.789533] wcd9380-codec sdw:0:0217:010d:00:3: Slave 1 state check1: UNATTACHED, status was 1
[   14.789717] qcom-soundwire 3330000.soundwire-controller: qcom_swrm_irq_handler: SWR bus clsh detected
[   14.796164] wcd9380-codec sdw:0:0217:010d:00:3: Slave 1 state check1: UNATTACHED, status was 1

and without the runtime pm patch that you dropped in v2 I get
intermittent (e.g. twice in five boots):

[   11.527301] snd-sc8280xp sound: ASoC: adding FE link failed
[   11.527409] snd-sc8280xp sound: ASoC: topology: could not load header: -517
[   11.527557] qcom-apm gprsvc:service:2:1: tplg component load failed-517
[   11.527640] qcom-apm gprsvc:service:2:1: ASoC: error at snd_soc_component_probe on gprsvc:service:2:1: -22
[   11.528079] snd-sc8280xp sound: ASoC: failed to instantiate card -22
[   11.533388] snd-sc8280xp: probe of sound failed with error -22

Again, this was with 6.4-rc5, but these problems are likely still there
also with linux-next.

Johan
