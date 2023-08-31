Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD32791724
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:34:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8C0084B;
	Mon,  4 Sep 2023 14:33:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8C0084B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693830853;
	bh=g8sbwu2YbI3GlpVnVO1aDiVF2xlXDysRfeOkwxZjIYk=;
	h=Subject:From:In-Reply-To:Date:CC:References:To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HBE2QwTYCEYfT6MmlvVVk3t+IB6qgx83wTCxR7AC9WCPG0YXNSWy1Egz8QTUu0lVS
	 YXoU5hQXll7B4RrgWGkWqrGGrjb2FkdXn3qxPs+Aa+nD6JskkTcSZCmeJ2Rv0AQAag
	 SW9wnVV5Xh75Meq1u/QF7V4rlPlgtG9E3n/Lhtxs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F970F80552; Mon,  4 Sep 2023 14:32:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A7CDF8055A;
	Mon,  4 Sep 2023 14:32:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4011CF80155; Thu, 31 Aug 2023 16:56:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8789BF80007
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 16:56:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8789BF80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=PpG4EXUC
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37VElhBp024174;
	Thu, 31 Aug 2023 09:56:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=
	PODMain02222019; bh=tL1M2KqPZ1Gruoc257MClXbv1zWRmnPUhuIWXHhN8pc=; b=
	PpG4EXUCbqlRyrE13oUzznOXr1zcy1uoPi/ggamaQjlPYdUTtF7TDIvPtkm6C2c4
	5HWlflZH9pc4VVSqaWc+tZtNMO9H7WYLxaM0XjVFBgiOAigL8XxyXtEV64+7oTny
	IkJV5+x61m6/CEbdo6yGfrCMJczegjtjW5kEOtJzXxibPxjfnjB3FRbtrKQo4/hX
	XKzEbRRfkzVheCdc/INAIUSxZNIxC242r3t865HoQID99KGr1jd5DPH7ibBdE1O1
	+ojAoYj3PN2Kl3OpvlTUz9Jz8S5WUYpRkAkETS8Rq5E35/TIHv9tcuoM8CwroDwB
	RtGb7bE/m66O4ry0xRCaHw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sqdtj5grc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Aug 2023 09:56:20 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 31 Aug
 2023 15:56:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Thu, 31 Aug 2023 15:56:18 +0100
Received: from smtpclient.apple (macC02FN0GLMD6T.ad.cirrus.com
 [141.131.156.196])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id ABAA311D4;
	Thu, 31 Aug 2023 14:56:16 +0000 (UTC)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH v2 1/4] ASoC: cs35l45: Checks index of cs35l45_irqs[]
From: "Rivera-Matos, Ricardo" <rriveram@opensource.cirrus.com>
In-Reply-To: <737c4114-5b54-444c-8a6a-de4e98566513@sirena.org.uk>
Date: Thu, 31 Aug 2023 09:56:05 -0500
CC: Vlad Karpovich <vkarpovi@opensource.cirrus.com>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-ID: <5B0EB2A2-2048-4A71-A4A9-D5167C7AB5EC@opensource.cirrus.com>
References: <20230830195536.448884-1-vkarpovi@opensource.cirrus.com>
 <737c4114-5b54-444c-8a6a-de4e98566513@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-Proofpoint-ORIG-GUID: HoQ4lxce8WazZ5vUB_uGKhNFVcYgS3mH
X-Proofpoint-GUID: HoQ4lxce8WazZ5vUB_uGKhNFVcYgS3mH
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=4607b54b17=rriveram@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BCSIUULNGELGJPVZMYS3AIKS3OB2EQRJ
X-Message-ID-Hash: BCSIUULNGELGJPVZMYS3AIKS3OB2EQRJ
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:32:27 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BCSIUULNGELGJPVZMYS3AIKS3OB2EQRJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Mark,

> On Aug 30, 2023, at 3:59 PM, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Wed, Aug 30, 2023 at 02:55:33PM -0500, Vlad Karpovich wrote:
>> Checks the index computed by the virq offset before printing the
>> error condition in cs35l45_spk_safe_err() handler.
>>=20
>> Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
>> Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
>=20
> Who actually wrote this patch?

I am the original author, allow me to clarify how and why this is =
supposed to work.

How:

static const struct cs35l45_irq cs35l45_irqs[] =3D {
	CS35L45_IRQ(AMP_SHORT_ERR, "Amplifier short error", =
cs35l45_spk_safe_err),
	CS35L45_IRQ(UVLO_VDDBATT_ERR, "VDDBATT undervoltage error", =
cs35l45_spk_safe_err),
	CS35L45_IRQ(BST_SHORT_ERR, "Boost inductor error", =
cs35l45_spk_safe_err),
	CS35L45_IRQ(BST_UVP_ERR, "Boost undervoltage error", =
cs35l45_spk_safe_err),
	CS35L45_IRQ(TEMP_ERR, "Overtemperature error", =
cs35l45_spk_safe_err),
	CS35L45_IRQ(AMP_CAL_ERR, "Amplifier calibration error", =
cs35l45_spk_safe_err),
	CS35L45_IRQ(UVLO_VDDLV_ERR, "LV threshold detector error", =
cs35l45_spk_safe_err),
	CS35L45_IRQ(GLOBAL_ERROR, "Global error", cs35l45_global_err),
	CS35L45_IRQ(DSP_WDT_EXPIRE, "DSP Watchdog Timer", =
cs35l45_dsp_wdt_expire),
	CS35L45_IRQ(PLL_UNLOCK_FLAG_RISE, "PLL unlock flag rise", =
cs35l45_pll_unlock),
	CS35L45_IRQ(PLL_LOCK_FLAG, "PLL lock", cs35l45_pll_lock),
	CS35L45_IRQ(DSP_VIRT2_MBOX, "DSP virtual MBOX 2 write flag", =
cs35l45_dsp_virt2_mbox_cb),
};

static irqreturn_t cs35l45_spk_safe_err(int irq, void *data)
{
	struct cs35l45_private *cs35l45 =3D data;
	int i;

	i =3D irq - regmap_irq_get_virq(cs35l45->irq_data, 0);

	if (i < 0 || i > 6)
		dev_err(cs35l45->dev, "Unspecified global error =
condition (%d) detected!\n", irq);
	else
		dev_err(cs35l45->dev, "%s condition detected!\n", =
cs35l45_irqs[i].name);

	return IRQ_HANDLED;
}

This snippet here is from the OoT CS35L45 driver. There are only seven =
root causes for a speaker safe error and when one of those root cause =
bits are set, we enter the common handler to print the root cause. Using =
the IRQ and the VIRQ number we do some math and print the name of the =
error as a dev_err.

Why:

Originally these root cause bits were treated as general bits and simply =
checked in the cs35l45_global_err() handler. A problem arose when the =
CS35L45 would come out of hibernation and the root cause bits would be =
masked by default. Treating the root cause bits as IRQs ensured that, =
like the other IRQ bits, the root cause bits would be unmasked before an =
IRQ could be serviced.

Further notes:

static const struct cs35l45_irq cs35l45_irqs[] =3D {
<snip>
	CS35L45_IRQ(GLOBAL_ERROR, "Global error", cs35l45_spk_safe_err),
	CS35L45_IRQ(DSP_WDT_EXPIRE, "DSP Watchdog Timer", =
cs35l45_spk_safe_err),
<snip>
};

This is from next-20230831. I am not sure how this happened, but these =
IRQs are not pointing to cs35l45_global_err and cs35l45_dsp_wdt_expire =
respectively. Maybe a bad cherry-pick. We will address this shortly.

I hope this addresses any confusion, please let me know if I can offer =
any further details.

Thanks,
Ricardo

