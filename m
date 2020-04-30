Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F391C0400
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 19:40:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 411B4168E;
	Thu, 30 Apr 2020 19:39:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 411B4168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588268420;
	bh=hvimypnkOVqyQDY0SHEk8UfnFCqDIvTpmzaald+Zg50=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=odUyX1c5SV+8wyBGKoivnd8iXut9ox24H0g23oCwh58nEip3QYHMdAUaRcqfLBeJj
	 xtGtPk4YfEZLvyD451G4b2FXwtb3JCsnXvJqjwz99T3RGUleYCr0Dwwyc22AAjkOPT
	 ixo95dpsMEbZAItrfQAhyn1qhpGYtrv3h0nvFNqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A8B7F800B6;
	Thu, 30 Apr 2020 19:38:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A77F5F801DB; Thu, 30 Apr 2020 19:38:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=MSGID_FROM_MTA_HEADER,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-oln040092255106.outbound.protection.outlook.com [40.92.255.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EE30F80136
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 19:38:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EE30F80136
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7rDD7N4o9QI2Hfusl4+WdNI2uvezdLESk5LR+Lw5vA/Ftho4otEwsPgiNHOnzNkSFl9V8Jd0OftfxN2vTZ7NebYj7E+2Qu26qp4b8uM+B215SiJJ2mnOCIuCuRIbgUfUufEdQxmzEzfGNP6X+v1p8sD6SWYjhNYOjcIBc50z58FrKhyYHDtQWW7eDfgv3kWFg8FQx4T4p0xfmCvJ0/PsJdHKzd61bn6aTHrxjPffwfkxpkSmq4xRXYuwcxP/qxChru3uAW/mkwWCyeEQfcNC419pwYOrnzl0Re4CMAONjyTH6vHesX78yVb6kSlXgdV76qOCizzJJ5m9lvx4Pc/Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzIuUgqA5lv2eIO7ylE2Tt56JnJ8MLsc2AjlCtzf/Cs=;
 b=SQeMoEa3Tk4fvPpiSrksQ/PvmfnfINDoN95l+DjPyhtZPFF2jFtdSUy7fEbnTOp+wsC4RYwXm5tqgAB7UwVuRHjMCBKVEi7iIg+8hgLV6QdNutD6KqqOl5jW1WmgH3xh1ZCzkfgiYb5AcrDiPFOT1D/ZzpjrTfPw1RgYSFarAzpfCdnZvBy5kAmbRbx8yKNHL+6efkPZ0W+1j91kK9np2zyImx99GJEz9YduCnXzkM/Kjc8MhDIdeZsXmwci1OkFOHVUBOkD0tE0PG5FP+9jNcu/DPyJLcpmTAbgmSpEKr3FcmBNQUe136hJbRca2/9LlWJs6opu4Kwprj2pqKB3tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com.au; dmarc=pass action=none
 header.from=outlook.com.au; dkim=pass header.d=outlook.com.au; arc=none
Received: from HK2APC01FT029.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4b) by
 HK2APC01HT178.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::450)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Thu, 30 Apr
 2020 17:38:25 +0000
Received: from PSXP216MB0438.KORP216.PROD.OUTLOOK.COM (10.152.248.56) by
 HK2APC01FT029.mail.protection.outlook.com (10.152.248.195) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.19 via Frontend Transport; Thu, 30 Apr 2020 17:38:25 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:53D3960472DA9B8161EA586CED5AF6C6DAABAC76F588CB0891ED34CD3FE0D8EF;
 UpperCasedChecksum:4CC799EA92E72E3C6DDE1BF9CD75E970320F0486A1C93FAD96FCD6719F63665A;
 SizeAsReceived:8606; Count:48
Received: from PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 ([fe80::21f1:20fb:d1f:8e25]) by PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 ([fe80::21f1:20fb:d1f:8e25%7]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 17:38:25 +0000
Date: Fri, 1 May 2020 01:38:16 +0800
From: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/1] Fiji GPU audio register timeout when in BACO state
Message-ID: <PSXP216MB04381A30909F66867E6B6BCC80AA0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
References: <s5hv9lkm49n.wl-tiwai@suse.de>
 <PSXP216MB043899DC52E6C6BF728D77CD80AC0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <s5ha72ulp2y.wl-tiwai@suse.de>
 <PSXP216MB043822350CDE9E7EEA37730880AD0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <CADnq5_MCQ7xHY=yhNtRW=ze0LRPzxuu-Mm7pD4kFa5R52UrGSw@mail.gmail.com>
 <s5h1ro6jn0v.wl-tiwai@suse.de>
 <CADnq5_Mjb_FnNOzjUfJZ7GSDzi-+Cfc1ZTuqm7UWCWVvY6DU_w@mail.gmail.com>
 <s5hwo5xj98v.wl-tiwai@suse.de>
 <PSXP216MB0438FE3E1CA577805BEC23C880AA0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <s5hh7x0kiwb.wl-tiwai@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hh7x0kiwb.wl-tiwai@suse.de>
X-ClientProxiedBy: ME2PR01CA0121.ausprd01.prod.outlook.com
 (2603:10c6:201:2e::13) To PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 (2603:1096:300:d::20)
X-Microsoft-Original-Message-ID: <20200430173816.GA2619@nicholas-dell-linux>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nicholas-dell-linux (2001:44b8:605f:11:45ec:d37e:a989:bf24) by
 ME2PR01CA0121.ausprd01.prod.outlook.com (2603:10c6:201:2e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.19 via Frontend Transport; Thu, 30 Apr 2020 17:38:22 +0000
X-Microsoft-Original-Message-ID: <20200430173816.GA2619@nicholas-dell-linux>
X-TMN: [SiXQG89bdHCeQStL9A0xI/u+4PzU18hzFZiW8eAQxiutKRhaGYCAcSm4kFq71B7C]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: c9fc70b7-36b6-4c3d-9988-08d7ed2d48c0
X-MS-TrafficTypeDiagnostic: HK2APC01HT178:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bm5/m/VTQGHxNtxJwcpEXdrzqtNfQULa3+lIK/judTNrqY5qTI7vrPPXxuKdsuJMx8nHanvvRqNHmq4PGMCczNEqs8zJ3zs4YOtIzGVKKIEqBS1v/dVzNJqv+ufM8wtzqx2WLHivFgQKjHPLrih0bN+DUpQvRcsEjTb3+4lq9zDxOE28zm4hx2S75OBq9laPLMMz1M/1zFgFzrtL9NG+KQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:PSXP216MB0438.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: yNecnxRMtBGqVhScep5VuA6Rxgj33hufS2iOL86sSHYDVqfm9HslTdBm4EUTZX8hwoa8eHF0SwzG+eVUvOAEFDW79n8G9yhZLJcTT3WoBfaUr2Kye6sOD5SkospQBaoCQ7z/ENZ+J2ppDakVe/fsQXSZhhYHczTRoa7s2yNeutBGwcnv0go33n87qCIyvEyvsu/lNe0urJtShU1qVy4ToQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fc70b7-36b6-4c3d-9988-08d7ed2d48c0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 17:38:25.2394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT178
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Takashi Iwai <tiwai@suse.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Lukas Wunner <lukas@wunner.de>,
 Alex Deucher <alexdeucher@gmail.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
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

On Thu, Apr 30, 2020 at 07:01:08PM +0200, Takashi Iwai wrote:
> On Thu, 30 Apr 2020 18:52:20 +0200,
> Nicholas Johnson wrote:
> > 
> > On Thu, Apr 30, 2020 at 05:14:56PM +0200, Takashi Iwai wrote:
> > > On Wed, 29 Apr 2020 18:19:57 +0200,
> > > Alex Deucher wrote:
> > > > 
> > > > On Wed, Apr 29, 2020 at 12:05 PM Takashi Iwai <tiwai@suse.de> wrote:
> > > > > Well, but the code path there is the runtime PM resume of the audio
> > > > > device and it means that GPU must have been runtime-resumed again
> > > > > beforehand via the device link.  So, it should have worked from the
> > > > > beginning but in reality not -- that is, apparently some inconsistency
> > > > > is found in the initial attempt of the runtime resume...
> > > > 
> > > > Yeah, it should be covered, but I wonder if there is something in the
> > > > ELD update sequence that needs to call pm_runtime_get_sync()?  The ELD
> > > > sequence on AMD GPUs doesn't work the same as on other vendors.  The
> > > > GPU driver has a backdoor into the HDA device's verbs to set update
> > > > the audio state rather than doing it via an ELD buffer update.  We
> > > > still update the ELD buffer for consistency.  Maybe when the GPU
> > > > driver sets the audio state at monitor detection time that triggers an
> > > > interrupt or something on the HDA side which races with the CPU and
> > > > the power down of the GPU.  That still seems unlikely though since the
> > > > runtime pm on the GPU side defaults to a 5 second suspend timer.
> > > 
> > > I'm not sure whether it's the race between runtime suspend of GPU vs
> > > runtime resume of audio.  My wild guess is rather that it's the timing
> > > GPU notifies to the audio; then the audio driver notifies to
> > > user-space and user-space opens the stream, which in turn invokes the
> > > runtime resume of GPU. But in GPU side, it's still under processing,
> > > so it proceeds before the GPU finishes its initialization job.
> > > 
> > > Nicholas, could you try the patch below and see whether the problem
> > > still appears?  The patch artificially delays the notification and ELD
> > > update for 300msec.  If this works, it means the timing problem.
> > The bug still occurred after applying the patch.
> > 
> > But you were absolutely correct - it just needed to be increased to 
> > 3000ms - then the bug stopped.
> 
> Interesting.  3 seconds are too long, but I guess 1 second would work
> as well?
1000ms indeed worked as well.

> 
> In anyway, the success with a long delay means that the sound setup
> after the full runtime resume of GPU seems working.
> 
> > Now the question is, what do we do now that we know this?
> > 
> > Also, are you still interested in the contents of the ELD# files? I can 
> > dump them all into a file at some specific moment in time which you 
> > request, if needed.
> 
> Yes, please take the snapshot before plugging, right after plugging
> and right after enabling.  I'm not sure whether your monitor supports
> the audio, and ELD contents should show that, at least.
The monitor supports the audio. There is 3.5mm audio out jack. No 
inbuilt speakers, although Samsung did sell a sound bar to suit it. The 
sound bar, which I do not own, presumably attaches via 3.5mm jack.

I am not sure if by plugging, you mean hot-adding Thunderbolt GPU or 
plugging the monitor to the GPU, so I have covered extra cases to be 
sure. I have taken the eld# files with the 1000ms patch applied, so the 
error is not triggered.

####
Before hot-adding the Thunderbolt GPU:
/proc/asound/card1 not present
####
####
After hot-adding the GPU with no monitor attached:

/proc/asound/card1 contains:
eld#0.0  eld#0.1  eld#0.2  eld#0.3  eld#0.4  eld#0.5

All of the above have the same contents:

monitor_present         0
eld_valid               0
####
####
Monitor attached to Fiji GPU but not enabled:

Same as above
####
####
Monitor enabled:

All files with same contents except for eld#0.1 which looks like:

monitor_present         1
eld_valid               1
monitor_name            U32E850
connection_type         DisplayPort
eld_version             [0x2] CEA-861D or below
edid_version            [0x3] CEA-861-B, C or D
manufacture_id          0x2d4c
product_id              0xce3
port_id                 0x0
support_hdcp            0
support_ai              0
audio_sync_delay        0
speakers                [0x1] FL/FR
sad_count               1
sad0_coding_type        [0x1] LPCM
sad0_channels           2
sad0_rates              [0xe0] 32000 44100 48000
sad0_bits               [0xe0000] 16 20 24
####

Cheers.
Regards, Nicholas.

> 
> 
> thanks,
> 
> Takashi
