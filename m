Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4758D7D32
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2024 10:22:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 721C7850;
	Mon,  3 Jun 2024 10:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 721C7850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717402962;
	bh=3AttaUkpZheUTQu4LxQ/6eDePa6nzJciotjCxL/3DuE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nTWosAw4VezhsdFlikzdmy2NffapaQuSLzGETd3EBZ2tSf74ROrOxEBgBphRxdZjn
	 JraGH7Azh3Vow1PxmxbyUOChBN9hNY+yN0F0o80Yat1tfE96wlmFEplC1TASVDkDso
	 8k/yvKnm5AyAk+LRqkIl9e/T1gA2UV2h6GehK4go=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76952F805AA; Mon,  3 Jun 2024 10:22:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B7E3F8059F;
	Mon,  3 Jun 2024 10:22:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9583EF8025A; Mon,  3 Jun 2024 10:18:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D1FBF800AC
	for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2024 10:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D1FBF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=H+sHq3o2
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4534bd8r027721;
	Mon, 3 Jun 2024 03:17:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=kqzYoKK/xn5/xaTv+q
	5s3bSIwJX2AbDTSqYAE+s/rc8=; b=H+sHq3o2bsjyseyXQxb45PVyPePoyP0pdd
	XD+Rok3Gv2wx5qf3sz77FM579CS+XUxQJ0/LIT6xe26drhyjKfuONhebRX/0pc00
	YYCIrekSk1fs5/ruHaZn8FohS+HhHU94K5hrhoVoxI5w1txZjcyo0xFESt5Fxp7k
	hojLgKZMpuM88Q0PBVCazUoscG5vrZAoOZRO/owHyznLMwGQx3Mr0Xm91Gk8a+3J
	5RFvHFVNxlBFFWteUW3lEy4rmL987nIBaZD4ae7gwf9Wl6HCnttz5AqOhsjNPRaO
	zc3/PogxfjMnlFXnPBCithlziHC3w5xvQb6ZjWfbcfdkSynV/n/Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3yg02hha2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 03:17:58 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 09:17:56 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 3 Jun 2024 09:17:56 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id AB4B8820249;
	Mon,  3 Jun 2024 08:17:56 +0000 (UTC)
Date: Mon, 3 Jun 2024 08:17:55 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <linux@treblig.org>
CC: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] ASoC: codecs: wm0010: remove unused struct
 'wm0010_spi_msg'
Message-ID: <Zl18MzMHGbE8B7/U@opensource.cirrus.com>
References: <20240601225446.183505-1-linux@treblig.org>
 <20240601225446.183505-3-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240601225446.183505-3-linux@treblig.org>
X-Proofpoint-GUID: -r9T5ub-_Fk7GKDeykYpbbSwa_HlL39h
X-Proofpoint-ORIG-GUID: -r9T5ub-_Fk7GKDeykYpbbSwa_HlL39h
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: EPQGLVTCTFEOPA67UP4VRJQ2A3MUC5V3
X-Message-ID-Hash: EPQGLVTCTFEOPA67UP4VRJQ2A3MUC5V3
X-MailFrom: prvs=3884a5a8fb=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPQGLVTCTFEOPA67UP4VRJQ2A3MUC5V3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Jun 01, 2024 at 11:54:45PM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> 'wm0010_spi_msg' has been unused since the original
> commit e3523e01869d ("ASoC: wm0010: Add initial wm0010 DSP driver").
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
