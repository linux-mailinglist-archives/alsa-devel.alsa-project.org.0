Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7AC7AB401
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 16:45:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74B67E0F;
	Fri, 22 Sep 2023 16:44:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74B67E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695393933;
	bh=1xDKodleAZiittNOHLTzIPVrNIwDO2XDun6LLAQQnwQ=;
	h=From:To:CC:References:In-Reply-To:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LOek3aBBmiT4wgos7E36IWjvPdVitIIkEpyIP8w0nJ7oedSgyYivz8KCJamBHXQwi
	 KtwZOfRQw7jnvSYdxZUlU5pvqIdnK/HSvPbkm7fuP40+2OA4pauZXnUq5c7xqfQuPt
	 vRJwNaCpi7taGgS1MJT6TNIrp31NWdor0OoxG5UA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 320EAF80551; Fri, 22 Sep 2023 16:44:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC380F80124;
	Fri, 22 Sep 2023 16:44:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFA74F80125; Fri, 22 Sep 2023 16:44:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E79BAF800F4
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 16:44:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E79BAF800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=UB14mOzO
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38M71ctN016438;
	Fri, 22 Sep 2023 09:44:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:references:in-reply-to:subject:date:message-id
	:mime-version:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=XJqRG5xI5bhaWjmEpLSFVPWC2U94D2ZplOTSDb1L+QY=; b=
	UB14mOzOmBVaA+jPLL0P/g3SYikUVcYEK5aqq+uvViKyqKHCeGuIQE/IJ0MVYPwa
	UkHn2as5a/1ZL40E+eSzE7nAMVaFqQ5+sMqFE+sFnU6i+AX7R5vPiDu+9YNDXg7I
	bmmDnQTxu5oRtRsQdKdNQqE2QpalWAhslLABgqVm26plWBmpk8ekNnwM3pAP5EVs
	3TYaAk7zQ6yMGwdu7r47adtT4vJObS35K7lC5lzsqZ/i69PbP8NKeRTO57mrpG2Q
	ygeqewPdOIZqh6oMidoyTQ6joT+DMoyNCTUKmCAbaGXDuJcXsk8VOVY0Gp7KDCCV
	i5gd9TF0qny0emCt1/10Xg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t8tvhsan3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 09:44:32 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 22 Sep
 2023 15:44:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Fri, 22 Sep 2023 15:44:30 +0100
Received: from LONN2DGDQ73 (LONN2DGDQ73.ad.cirrus.com [198.61.65.157])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7D4B815B9;
	Fri, 22 Sep 2023 14:44:30 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: 'Takashi Iwai' <tiwai@suse.de>
CC: 'Mark Brown' <broonie@kernel.org>, 'Jaroslav Kysela' <perex@perex.cz>,
        'Takashi Iwai' <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
References: <20230922142818.2021103-1-sbinding@opensource.cirrus.com>
 <87a5tecm2m.wl-tiwai@suse.de>
In-Reply-To: <87a5tecm2m.wl-tiwai@suse.de>
Subject: RE: [PATCH v1 0/2] ALSA: cs35l41: prevent old firmwares using
 unsupported commands
Date: Fri, 22 Sep 2023 15:44:30 +0100
Message-ID: <005e01d9ed63$4b605550$e220fff0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK3Dt8Nv883/5uOfTFCurOQPlFa6QMKDBpDrlRXuLA=
Content-Language: en-gb
X-Proofpoint-ORIG-GUID: ovuDJwJ7rBXnOnHp7tW06c-LVZ-Rwdoo
X-Proofpoint-GUID: ovuDJwJ7rBXnOnHp7tW06c-LVZ-Rwdoo
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IX4OFONGYGLYIDMHSAGP2ZXVBF3APKEA
X-Message-ID-Hash: IX4OFONGYGLYIDMHSAGP2ZXVBF3APKEA
X-MailFrom: prvs=462953d6eb=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IX4OFONGYGLYIDMHSAGP2ZXVBF3APKEA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Friday, September 22, 2023 3:36 PM
> To: Stefan Binding <sbinding@opensource.cirrus.com>
> Cc: Mark Brown <broonie@kernel.org>; Jaroslav Kysela
> <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; alsa-devel@alsa-
> project.org; linux-kernel@vger.kernel.org;
> patches@opensource.cirrus.com
> Subject: Re: [PATCH v1 0/2] ALSA: cs35l41: prevent old firmwares
using
> unsupported commands
> 
> On Fri, 22 Sep 2023 16:28:16 +0200,
> Stefan Binding wrote:
> >
> > Some systems use older firmware which does not support newer
> commands
> > which are used to enable external boost. For those systems, we can
> > workaround this by writing the registers directly.
> >
> > We can use the firmware version, stored inside cs_dsp, to
determine
> > whether or not the command is supported.
> > To achieve this, it requires a cleanup in the api, to pass the
cs_dsp
> > struct into the function.
> >
> > We can also remove the redundant boolean firmware_running from the
> HDA
> > driver, and use the equivalent state inside cs_dsp.
> 
> So those are fixes needed for 6.6 kernel?  Or they are something
new?

These are to fix the issue that was reported on the Lenovo Legion 7
16ACHg6,
which was introduced after the fixes to CS35L41 HDA System Suspend.

Thanks,
Stefan

> 
> > This chain is based on Mark's branch, since the api change was
made to
> > the function in sound/soc/codecs/cs35l41-lib.c.
> 
> I'd need a PR from Mark before applying those, then.
> 
> 
> thanks,
> 
> Takashi

