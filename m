Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E85551C032D
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 18:54:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 712E41689;
	Thu, 30 Apr 2020 18:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 712E41689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588265665;
	bh=UkImhl06TpPe1Q7DX0SAnNEmwwiCxwOr+SRls56+q14=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GroFlJaU/2BQ6i1TJoYqJsut0WQnCfeMUb4foroQ7SMD71bIH4ow/VnwM9jPhy5JF
	 PQBjznOg6StEnjGMxwwPzTYk9MU8YM6rA48DObeE8DnVhzwsNAoM1h+qk22my52/3K
	 KM4OWq/AuerFGdy4FZ6bfmNv2xQsXpgh/lwpaInc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0C54F80123;
	Thu, 30 Apr 2020 18:52:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB234F801DB; Thu, 30 Apr 2020 18:52:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=MSGID_FROM_MTA_HEADER,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-oln040092255034.outbound.protection.outlook.com [40.92.255.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 768C1F800E5
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 18:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 768C1F800E5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjoBAicJR+mMHzajdBG1bz2zzqhqOSE6j8hsIfIqu/XUa0lpIjzt62EGWs9wRmJ9+jGlYNjusRfB6me17rDpGrgFhvA6UgtZhBocJv8TUmK1IGkDcd5a656fz5TaPKFgNFABYpzZqRl9mlRmIqRnABayfno/PmUfg48/LtDrvdOwoDxQsM14ZIsdMiIaLAIy8mMBnH471y2xF//D7y//55suRHgJ3aVIJaXv9VMJboy5u10z7qK6mI5jxUFqsMN5KYRpCDYQw5uKOLL6d83tZ+SDTrWiMoT6H/HSC7R8ghemzBjpQ07hlGIlSQweMUf+nnwSzb2BHxbaRTUuQPRWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+o42zPEGJ/oXcDYgZQm9QWtOOcRcoXaVkOJ0KIUS4pE=;
 b=ADDPSXWwqocnpUFutCStAkRLHtOqzuMiov4JJ2Mgccg9S3D7l6sH9hbf05TDOrYnJiIXM6po2+MRhjzH/bO438RB1BEia2sMS6iqKHWmj8CFYHv+ozSAoVeNeWX2EuXgcKY/5dDxxUevMbGpve/da79q4JbNbBmVljjvfzRRK/J9xH3K2f5u1BMgZNYFNakbPqfOsehmzUFv41C4MaazSnYC0xqtEJpcrcZnerZEbij/ZO17h+8gzinM7RYNU8ZIgAPBndpaLBqF8Zjs0zcqxlHzZNQiHveGauAxGYgsEPCc6MnKBkQjW2Z3WTLJP8jgN1HEwuzss7gvlXhsV6HqpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com.au; dmarc=pass action=none
 header.from=outlook.com.au; dkim=pass header.d=outlook.com.au; arc=none
Received: from HK2APC01FT015.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::44) by
 HK2APC01HT112.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::374)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Thu, 30 Apr
 2020 16:52:30 +0000
Received: from PSXP216MB0438.KORP216.PROD.OUTLOOK.COM (10.152.248.60) by
 HK2APC01FT015.mail.protection.outlook.com (10.152.248.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.19 via Frontend Transport; Thu, 30 Apr 2020 16:52:30 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:95BFEC1DA74630FD6B7ABF08974A0F76D51D719BCEA04F600CD0303D03116D6B;
 UpperCasedChecksum:6E64F34058E6839190143D536C05054FA653373A5BD8E3A1C8814F880D1BEC02;
 SizeAsReceived:8553; Count:48
Received: from PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 ([fe80::21f1:20fb:d1f:8e25]) by PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 ([fe80::21f1:20fb:d1f:8e25%7]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 16:52:30 +0000
Date: Fri, 1 May 2020 00:52:20 +0800
From: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/1] Fiji GPU audio register timeout when in BACO state
Message-ID: <PSXP216MB0438FE3E1CA577805BEC23C880AA0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
References: <s5h4kt4ojrf.wl-tiwai@suse.de>
 <CADnq5_MMQ5_MjEg=bkJJGMJP53RjB3yxvOW0nUDeWxzg3Q0pVQ@mail.gmail.com>
 <s5hv9lkm49n.wl-tiwai@suse.de>
 <PSXP216MB043899DC52E6C6BF728D77CD80AC0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <s5ha72ulp2y.wl-tiwai@suse.de>
 <PSXP216MB043822350CDE9E7EEA37730880AD0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <CADnq5_MCQ7xHY=yhNtRW=ze0LRPzxuu-Mm7pD4kFa5R52UrGSw@mail.gmail.com>
 <s5h1ro6jn0v.wl-tiwai@suse.de>
 <CADnq5_Mjb_FnNOzjUfJZ7GSDzi-+Cfc1ZTuqm7UWCWVvY6DU_w@mail.gmail.com>
 <s5hwo5xj98v.wl-tiwai@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hwo5xj98v.wl-tiwai@suse.de>
X-ClientProxiedBy: MEAPR01CA0037.ausprd01.prod.outlook.com (2603:10c6:201::25)
 To PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 (2603:1096:300:d::20)
X-Microsoft-Original-Message-ID: <20200430165220.GA2595@nicholas-dell-linux>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nicholas-dell-linux (2001:44b8:605f:11:45ec:d37e:a989:bf24) by
 MEAPR01CA0037.ausprd01.prod.outlook.com (2603:10c6:201::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.19 via Frontend Transport; Thu, 30 Apr 2020 16:52:26 +0000
X-Microsoft-Original-Message-ID: <20200430165220.GA2595@nicholas-dell-linux>
X-TMN: [pnKGigBt9wFqxyXKlPVIR7VVr52nKl9mw+q9icRvd1/cuyFvBpuRvOUcr0O58haB]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 105f18b1-41e6-4880-383a-08d7ed26de76
X-MS-TrafficTypeDiagnostic: HK2APC01HT112:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W4vQkiwqpinIeNkxNFrN9vmwljowWvXutD3OTEmeq3xOJGV/6dIAcHwidN4PUsbZGtIdubtIs5Sg98NFoVjkhoQfN1Qc/rlvlrQrY+7pUd+wQzhe9z9yjjJWbQPHBBSBCBf5CzWfc0w4Kf8BxC+MkD2tHDGUQ8xqqAucmxmzEe9YK7x+m6uCX6dDkRIRRejXcfcZoNtskLbKem0/D0GlFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:PSXP216MB0438.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: 76AkZ1QjrdmBcZW28J0KR+XWa0XJoA1B83g9fUXxa4uzgKwD/8L3z/nKROSLooP9rr7CEj3SwNp5GH/9UcIzgbK6Fnicx2BLBmft61AINFEb7G5SiK48Nf4nMW+RbwutEMGX5jlTcJc9iOGdXvrReI0VxE9nCLl8RHTA28bXdhPXZYG6xnxlzynwBdZJ0R59O9z7DCafdjSoWjALyzwCwg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 105f18b1-41e6-4880-383a-08d7ed26de76
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 16:52:30.3469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT112
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

On Thu, Apr 30, 2020 at 05:14:56PM +0200, Takashi Iwai wrote:
> On Wed, 29 Apr 2020 18:19:57 +0200,
> Alex Deucher wrote:
> > 
> > On Wed, Apr 29, 2020 at 12:05 PM Takashi Iwai <tiwai@suse.de> wrote:
> > > Well, but the code path there is the runtime PM resume of the audio
> > > device and it means that GPU must have been runtime-resumed again
> > > beforehand via the device link.  So, it should have worked from the
> > > beginning but in reality not -- that is, apparently some inconsistency
> > > is found in the initial attempt of the runtime resume...
> > 
> > Yeah, it should be covered, but I wonder if there is something in the
> > ELD update sequence that needs to call pm_runtime_get_sync()?  The ELD
> > sequence on AMD GPUs doesn't work the same as on other vendors.  The
> > GPU driver has a backdoor into the HDA device's verbs to set update
> > the audio state rather than doing it via an ELD buffer update.  We
> > still update the ELD buffer for consistency.  Maybe when the GPU
> > driver sets the audio state at monitor detection time that triggers an
> > interrupt or something on the HDA side which races with the CPU and
> > the power down of the GPU.  That still seems unlikely though since the
> > runtime pm on the GPU side defaults to a 5 second suspend timer.
> 
> I'm not sure whether it's the race between runtime suspend of GPU vs
> runtime resume of audio.  My wild guess is rather that it's the timing
> GPU notifies to the audio; then the audio driver notifies to
> user-space and user-space opens the stream, which in turn invokes the
> runtime resume of GPU. But in GPU side, it's still under processing,
> so it proceeds before the GPU finishes its initialization job.
> 
> Nicholas, could you try the patch below and see whether the problem
> still appears?  The patch artificially delays the notification and ELD
> update for 300msec.  If this works, it means the timing problem.
The bug still occurred after applying the patch.

But you were absolutely correct - it just needed to be increased to 
3000ms - then the bug stopped.

Now the question is, what do we do now that we know this?

Also, are you still interested in the contents of the ELD# files? I can 
dump them all into a file at some specific moment in time which you 
request, if needed.

Thanks.
Regards, Nicholas

> 
> 
> thanks,
> 
> Takashi
> 
> --- a/sound/pci/hda/patch_hdmi.c
> +++ b/sound/pci/hda/patch_hdmi.c
> @@ -767,6 +767,7 @@ static void check_presence_and_report(struct hda_codec *codec, hda_nid_t nid,
>  	if (pin_idx < 0)
>  		return;
>  	mutex_lock(&spec->pcm_lock);
> +	get_pin(spec, pin_idx)->repoll_count = 1;
>  	hdmi_present_sense(get_pin(spec, pin_idx), 1);
>  	mutex_unlock(&spec->pcm_lock);
>  }
> @@ -1647,7 +1648,10 @@ static void sync_eld_via_acomp(struct hda_codec *codec,
>  				      per_pin->dev_id, &eld->monitor_present,
>  				      eld->eld_buffer, ELD_MAX_SIZE);
>  	eld->eld_valid = (eld->eld_size > 0);
> -	update_eld(codec, per_pin, eld, 0);
> +	if (per_pin->repoll_count)
> +		schedule_delayed_work(&per_pin->work, msecs_to_jiffies(300));
> +	else
> +		update_eld(codec, per_pin, eld, 0);
>  	mutex_unlock(&per_pin->lock);
>  }
>  
> @@ -1669,6 +1673,11 @@ static void hdmi_repoll_eld(struct work_struct *work)
>  	struct hdmi_spec *spec = codec->spec;
>  	struct hda_jack_tbl *jack;
>  
> +	if (codec_has_acomp(codec)) {
> +		per_pin->repoll_count = 0;
> +		goto check;
> +	}
> +
>  	jack = snd_hda_jack_tbl_get_mst(codec, per_pin->pin_nid,
>  					per_pin->dev_id);
>  	if (jack)
> @@ -1677,6 +1686,7 @@ static void hdmi_repoll_eld(struct work_struct *work)
>  	if (per_pin->repoll_count++ > 6)
>  		per_pin->repoll_count = 0;
>  
> + check:
>  	mutex_lock(&spec->pcm_lock);
>  	hdmi_present_sense(per_pin, per_pin->repoll_count);
>  	mutex_unlock(&spec->pcm_lock);
