Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBD7AF26A
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 22:54:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2FD216CC;
	Tue, 10 Sep 2019 22:53:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2FD216CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568148847;
	bh=B7abogkvD4XeBSh189sTn50bWEG8SXGPQc3z+paq0IY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KWLvGeRTMu7mAuTgrZ4ufzMnh4Ih//zXOv3+hlTdgNcc5lvNkwrJZpggOK1eP+Clr
	 c/inQ28qDAVXzcWvwVS00KQjbnv78/PUBT3Q6cp1NMZeW0CzMTqUCCazseZkD8ylYe
	 53h8VCltC22RMRZvTLSEr0fidjV+pHXpz2VVskRk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81ECEF80321;
	Tue, 10 Sep 2019 22:52:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABFF5F80393; Tue, 10 Sep 2019 22:52:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50935F800E9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 22:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50935F800E9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2019 13:52:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,490,1559545200"; d="scan'208";a="214439765"
Received: from rmarszew-mobl1.ger.corp.intel.com (HELO [10.251.24.188])
 ([10.251.24.188])
 by fmsmga002.fm.intel.com with ESMTP; 10 Sep 2019 13:52:11 -0700
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 tiwai@suse.de
References: <20190910182916.29693-1-kai.vehmanen@linux.intel.com>
 <20190910182916.29693-3-kai.vehmanen@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a1b70a79-3bac-95e6-9091-9acee31a0a05@linux.intel.com>
Date: Tue, 10 Sep 2019 15:31:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910182916.29693-3-kai.vehmanen@linux.intel.com>
Content-Language: en-US
Cc: libin.yang@intel.com
Subject: Re: [alsa-devel] [PATCH v3 02/10] ALSA: hda/hdmi - allow control
 creation without a linked pcm
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 9/10/19 1:29 PM, Kai Vehmanen wrote:
> Fix the logic in generic_hdmi_build_controls() to identify
> unused hda_pcm entries by searching for SNDRV_PCM_INVALID_DEVICE.
> This matches with logic in snd_hda_codec_build_pcms().
> 
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---
>   sound/pci/hda/patch_hdmi.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
> index 59aaee4a40fd..c52726e19f44 100644
> --- a/sound/pci/hda/patch_hdmi.c
> +++ b/sound/pci/hda/patch_hdmi.c
> @@ -2183,11 +2183,13 @@ static int generic_hdmi_build_jack(struct hda_codec *codec, int pcm_idx)
>   static int generic_hdmi_build_controls(struct hda_codec *codec)
>   {
>   	struct hdmi_spec *spec = codec->spec;
> +	struct hda_pcm *hda_pcm;
>   	int dev, err;
>   	int pin_idx, pcm_idx;
>   
>   	for (pcm_idx = 0; pcm_idx < spec->pcm_used; pcm_idx++) {
> -		if (!get_pcm_rec(spec, pcm_idx)->pcm) {
> +		hda_pcm = get_pcm_rec(spec, pcm_idx);
> +		if (hda_pcm->device == SNDRV_PCM_INVALID_DEVICE) {

I find it hard to follow the logic.
Before this patch only device 0 would be considered NO_PCM
Not it's -1, so wondering if this is a fix unrelated to this series or 
if there is a dependency on follow-up patches?

#define SNDRV_PCM_INVALID_DEVICE      (-1)

>   			/* no PCM: mark this for skipping permanently */
>   			set_bit(pcm_idx, &spec->pcm_bitmap);
>   			continue;
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
