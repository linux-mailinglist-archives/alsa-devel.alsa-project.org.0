Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3132763A55C
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 10:49:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18A53164D;
	Mon, 28 Nov 2022 10:48:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18A53164D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669628976;
	bh=he6z0QczvAwDyxM7/GpmILjYMt9s70Kg0BeQsNQapSs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WxzdlGg2pOPMJmhwfCuJVTR3Ck+whkM+0p4wiqScmZjSfzykNqunx5FlY/VsvXND2
	 wwpNVv1+inwZ3hnbKEDv467M4ly5ZAZMk9mpXSwBEi8Wfu40C2jhpIbS2aS5zeckVw
	 Yh5bQ26VmWAZN/fEluGSh5l6f4PHiCo3VeV0TqHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A01BF8024C;
	Mon, 28 Nov 2022 10:48:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C7C8F8020D; Mon, 28 Nov 2022 10:48:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_76,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D423F8016E
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 10:48:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D423F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="HFZeZw5E"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AS94pmb031089; Mon, 28 Nov 2022 03:48:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=u4kN8qSEdRaoC/vqF/vqkLOv5Fb0wByigupORQ9e7T4=;
 b=HFZeZw5EXFWT0K+c0O1zwZ5MfXWEEI5BNwspt5VNq+/I6hbLluAUpAADAAHnrELazX6c
 CWITOBu6mqwGgiWT2HTuKWdBVdyh70DOHZGYf4mf5zJbGv0vAPM4iejFrNk8r/013i0x
 XuNt8YUHurdSpEhp4qlrf/mQ/CysQbh9MEx22lCXb7IwGLFARtCRAgcfCjVgdI/kjtEV
 d+A007NqSfh3a54EQE8WU/dEOtyGwp1Sd6VV4h08MFcSoabL1PpjfDLa+Up3Nud86Huo
 0Y59TCtDDolJtroEyPFCp/9K34p2/ODBJKK3qE1HZg03rwVWjjdI1SeVvJMZNkaIukZV vg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3m3g3vhr1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 03:48:31 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Mon, 28 Nov
 2022 03:48:29 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Mon, 28 Nov 2022 03:48:29 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 49E18B06;
 Mon, 28 Nov 2022 09:48:29 +0000 (UTC)
Date: Mon, 28 Nov 2022 09:48:29 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: cs42l51: Correct PGA Volume minimum value
Message-ID: <20221128094829.GH105268@ediswmail.ad.cirrus.com>
References: <20221125163748.1288942-1-ckeepax@opensource.cirrus.com>
 <20221125163748.1288942-2-ckeepax@opensource.cirrus.com>
 <CABDcavbtBBU7ySPK32104nZB5RHf2=LFuOOYOF-Ze1EDoM+etw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABDcavbtBBU7ySPK32104nZB5RHf2=LFuOOYOF-Ze1EDoM+etw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: ZEDHlPXu5bBf9ccLXcsIqrx688hrB6BJ
X-Proofpoint-ORIG-GUID: ZEDHlPXu5bBf9ccLXcsIqrx688hrB6BJ
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, broonie@kernel.org,
 james.schulman@cirrus.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sat, Nov 26, 2022 at 12:15:10PM +0100, Guillermo Rodriguez Garcia wrote:
> El vie, 25 nov 2022 a las 17:37, Charles Keepax
> (<ckeepax@opensource.cirrus.com>) escribió:
> >
> > The table in the datasheet actually shows the volume values in the wrong
> > order, with the two -3dB values being reversed. This appears to have
> > caused the lower of the two values to be used in the driver when the
> > higher should have been, correct this mixup.
> >
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >
> > No changes since v1.
> >
> >  sound/soc/codecs/cs42l51.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
> > index 51721edd8f53c..e88d9ff95cdfc 100644
> > --- a/sound/soc/codecs/cs42l51.c
> > +++ b/sound/soc/codecs/cs42l51.c
> > @@ -143,7 +143,7 @@ static const struct snd_kcontrol_new cs42l51_snd_controls[] = {
> >                         0, 0xA0, 96, adc_att_tlv),
> >         SOC_DOUBLE_R_SX_TLV("PGA Volume",
> >                         CS42L51_ALC_PGA_CTL, CS42L51_ALC_PGB_CTL,
> > -                       0, 0x19, 30, pga_tlv),
> > +                       0, 0x1A, 30, pga_tlv),
> 
> The original patch where this control was added [1] already used 0x1A,
> however this was later changed to 0x19 in [2]. Your patch now reverts
> that change. Does this mean [2] was incorrect? If that is the case,
> shouldn't the commit message for this patch mention that it fixes [2]
> ?
> 
>  [1]: https://lore.kernel.org/all/20200918134317.22574-1-guille.rodriguez@gmail.com/
>  [2]: https://lore.kernel.org/all/20220602162119.3393857-7-ckeepax@opensource.cirrus.com/
> 

Hmm... good digging, I didn't realise it was me who broke that.
Apologies in that chain I went around and checked a bunch of SX
controls to make sure they matched the datasheets, but it seems
I got a bit confused by the weird ordering of the values in the
datasheet. Since you have hardware would you be able to check,
before we merge this revert? A simple check that writing 0 to the
control sets the register value to 0x1A and writing 30 sets the
register to 0x18 would suffice.

Thanks,
Charles
