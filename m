Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C0E288BA5
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Oct 2020 16:39:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F2901664;
	Fri,  9 Oct 2020 16:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F2901664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602254397;
	bh=qMPUoY6V3qUORBFazuVirFE+eWJxi6hcqJVAh5P91rc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QuctpB08AmN0CdyrFnAD1EXapS8G/aY/jcVN7d5rdTQiWnMetgyznsZe0njKgRmvF
	 ZlHgkj/rcjpGTFMEmb2Ux0gsHqJLhmKItrlNvI8X10NPJMZcBRIs4eAb8fcbUXzvdk
	 q2W1cjrRozhKAeKxk7BpioV6T1kA0bCiF+YafLFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAEC2F80165;
	Fri,  9 Oct 2020 16:38:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 639F9F80165; Fri,  9 Oct 2020 16:38:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16295F80128
 for <alsa-devel@alsa-project.org>; Fri,  9 Oct 2020 16:38:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16295F80128
IronPort-SDR: +dGQz7H8YaFthfjFzeBarHDpcnBy6N9I6AIKjxoqTMZofn8VdL16BnsKrfDNEQH1cSqAkjFadN
 r4+60djMJY1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="165553198"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="165553198"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 07:38:08 -0700
IronPort-SDR: LWLH9QF3iFW2yamHJFMIwyGN1n4PmdveFxQ9WdHi1kMggyi27/C0XGj0tp7QEtolaYV8Ne9blW
 rvRpdVXPTFGQ==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="419467300"
Received: from sjkim-mobl1.amr.corp.intel.com (HELO [10.212.131.60])
 ([10.212.131.60])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 07:38:07 -0700
Subject: Re: [PATCH 1/1] ALSA: hda: fix jack detection with Realtek codecs
 when in D3
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 tiwai@suse.de
References: <20201009140227.691140-1-kai.vehmanen@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f1c3ff3f-8f7c-a82c-b03d-32369e32e395@linux.intel.com>
Date: Fri, 9 Oct 2020 09:38:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201009140227.691140-1-kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Kailang Yang <kailang@realtek.com>
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



On 10/9/20 9:02 AM, Kai Vehmanen wrote:
> In case HDA controller is active, but codec is runtime suspended, jack
> detection is not successful and no interrupt is raised. This has been
> observed with multiple Realtek codecs and HDA controllers from different
> vendors. Bug does not occur if both codec and controller are active,
> or both are in suspend. Bug can be easily hit on desktop systems with
> no built-in speaker.
> 
> The problem can be fixed by powering up the codec once after every
> controller runtime resume. Even if codec goes back to suspend, the jack
> detection will now work. Add a flag to 'hda_codec' to describe codecs
> that require this flow from the controller driver. Mark all Realtek
> codecs with this flag.

It does make sense to request the codec to resume when the controller 
resumes, we did the same for SoundWire IIRC.

I am still confused on what happens if e.g. the controller resumes and 
remains active, e.g. capturing from the DMIC. The codec would become 
suspended after a while and then we would be back to the same problem, 
wouldn't we?

Or are you saying that this initial resume of the codec is enough?

> 
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=209379
> Cc: Kailang Yang <kailang@realtek.com>
> Co-developed-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---
>   include/sound/hda_codec.h     | 1 +
>   sound/pci/hda/hda_intel.c     | 8 ++++++--
>   sound/pci/hda/patch_realtek.c | 6 ++++++
>   3 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
> index 0fea49bfc5e8..73827b7d17e0 100644
> --- a/include/sound/hda_codec.h
> +++ b/include/sound/hda_codec.h
> @@ -253,6 +253,7 @@ struct hda_codec {
>   	unsigned int force_pin_prefix:1; /* Add location prefix */
>   	unsigned int link_down_at_suspend:1; /* link down at runtime suspend */
>   	unsigned int relaxed_resume:1;	/* don't resume forcibly for jack */
> +	unsigned int forced_resume:1; /* forced resume for jack */
>   	unsigned int mst_no_extra_pcms:1; /* no backup PCMs for DP-MST */
>   
>   #ifdef CONFIG_PM
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index 61e495187b1a..cfc073c992e7 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -1002,12 +1002,16 @@ static void __azx_runtime_resume(struct azx *chip, bool from_rt)
>   	azx_init_pci(chip);
>   	hda_intel_init_chip(chip, true);
>   
> -	if (status && from_rt) {
> -		list_for_each_codec(codec, &chip->bus)
> +	if (from_rt) {
> +		list_for_each_codec(codec, &chip->bus) {
> +			if (codec->forced_resume && pm_runtime_suspended(hda_codec_dev(codec)))
> +				pm_request_resume(hda_codec_dev(codec));
> +
>   			if (!codec->relaxed_resume &&
>   			    (status & (1 << codec->addr)))
>   				schedule_delayed_work(&codec->jackpoll_work,
>   						      codec->jackpoll_interval);
> +		}
>   	}
>   
>   	/* power down again for link-controlled chips */
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index f89506dffd5b..e4ab483db72f 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -849,6 +849,12 @@ static int alc_build_controls(struct hda_codec *codec)
>   static void alc_pre_init(struct hda_codec *codec)
>   {
>   	alc_fill_eapd_coef(codec);
> +
> +	/*
> +	 * if controller is resumed from suspend, while codec remains in D3, codec
> +	 * needs to be woken up once or otherwise jack detection does not work
> +	 */
> +	codec->forced_resume = 1;
>   }
>   
>   #define is_s3_resume(codec) \
> 
