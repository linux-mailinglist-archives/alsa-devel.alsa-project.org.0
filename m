Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE93710C326
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 05:13:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 377DE16D8;
	Thu, 28 Nov 2019 05:12:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 377DE16D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574914387;
	bh=+5jriu+tsPOLdQhPe3PBIxe+ziXfDH1cywILo5innAc=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GN8lRCxqtxg28QAxW3pzXK/nyQuaDvP9PApyBNjhUsSNnzMqHW3Vrwb2EYpSiuQOs
	 5tyyeAOiKiKyJyzM2lBg8Sfm8atCDdFGS5UPL+iHbvKJY7SuUDkD8DjmyL4qIRUi1/
	 jDgFFzYlKr67cx/rnmsE7SMRgDIThnom1uqHJMeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF42FF8013A;
	Thu, 28 Nov 2019 05:11:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D50AAF80149; Thu, 28 Nov 2019 05:11:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26D2CF80106
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 05:11:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26D2CF80106
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="ksmZSVce"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ddf48df0001>; Wed, 27 Nov 2019 20:11:11 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 27 Nov 2019 20:11:07 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 27 Nov 2019 20:11:07 -0800
Received: from [10.24.218.121] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 28 Nov
 2019 04:11:06 +0000
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <tiwai@suse.de>
References: <20191127161240.17026-1-kai.vehmanen@linux.intel.com>
X-Nvconfidentiality: public
From: Nikhil Mahale <nmahale@nvidia.com>
Message-ID: <e743fbad-0a1e-f248-acb7-d64e8fa87233@nvidia.com>
Date: Thu, 28 Nov 2019 09:41:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191127161240.17026-1-kai.vehmanen@linux.intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1574914271; bh=Tqup9t1aEYShMGdnawLerunOzfxt0VSqx5NuekLAqLw=;
 h=X-PGP-Universal:Subject:To:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ksmZSVceKLLgwkCbkXkTFnw+NE7tuveYVJ3VOpiiKCTS/A8XOnrA0PWrQvj6Nqgqu
 t5JC7X8r3ESL0LS+IIZDLa4jGwlR5CL8UN+2Jtg669F/SLJTENdSjbolK1wrgOdU56
 D+PX/nSoHn24hs1jYvHtCxE+sfJiFbH+hypjGZBEZOdQ/KCRfjG2bfnzl4O1HYpVQI
 saj3DevnNbFdQHKir0oyA+bQiMCeplzHcqerMRQx0+eWX8UK02NCI7I85TBdXhpeSo
 P1G4YSqJfLdHiTDtwBkZtcl3LyOJPwjPOVq57ZEzLHyEj0DUvD1dcVSX+8Bt8qv6A6
 gXVnXrECur1oQ==
Subject: Re: [alsa-devel] [PATCH v3] ALSA: hda: hdmi - fix regression in
 connect list handling
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Sorry for this regression,

This idea to copy the values directly from spec->cvt_nids here without the
override hack as we have now, seems good to me.

Thanks,
Nikhil mahale

On 11/27/19 9:42 PM, Kai Vehmanen wrote:
> Fix regression in how intel_haswell_fixup_connect_list()
> results are used in hda_read_pin_conn(). Use of
> snd_hda_get_raw_connections() in hda_read_pin_conn() bypasses
> the cache and thus also bypasses the overridden pin connection
> list. On platforms that require the connection list fixup,
> mux list will be empty and HDMI playback will fail to -EBUSY
> at open.
> 
> Fix the regression in hda_read_pinn_conn(). Simplify code
> as suggested by Takashi Iwai to remove old
> intel_haswell_fixup_connect_list() and copy the cvt_nid list
> directly and not use snd_hda_override_conn_list() at all.
> 
> Fixes: 9c32fea83692 ("ALSA: hda - Add DP-MST support for non-acomp codecs")
> BugLink: https://github.com/thesofproject/linux/issues/1537
> Cc: Nikhil Mahale <nmahale@nvidia.com>
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---
>  sound/pci/hda/patch_hdmi.c | 38 ++++++++++++--------------------------
>  1 file changed, 12 insertions(+), 26 deletions(-)
> 
> diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
> index 55d20e40a195..373ca99b7a2f 100644
> --- a/sound/pci/hda/patch_hdmi.c
> +++ b/sound/pci/hda/patch_hdmi.c
> @@ -1302,6 +1302,7 @@ static int hdmi_read_pin_conn(struct hda_codec *codec, int pin_idx)
>  	struct hdmi_spec_per_pin *per_pin = get_pin(spec, pin_idx);
>  	hda_nid_t pin_nid = per_pin->pin_nid;
>  	int dev_id = per_pin->dev_id;
> +	int conns;
>  
>  	if (!(get_wcaps(codec, pin_nid) & AC_WCAP_CONN_LIST)) {
>  		codec_warn(codec,
> @@ -1312,10 +1313,18 @@ static int hdmi_read_pin_conn(struct hda_codec *codec, int pin_idx)
>  
>  	snd_hda_set_dev_select(codec, pin_nid, dev_id);
>  
> +	if (spec->intel_hsw_fixup) {
> +		conns = spec->num_cvts;
> +		memcpy(per_pin->mux_nids, spec->cvt_nids,
> +		       sizeof(hda_nid_t) * conns);
> +	} else {
> +		conns = snd_hda_get_raw_connections(codec, pin_nid,
> +						    per_pin->mux_nids,
> +						    HDA_MAX_CONNECTIONS);
> +	}
> +
>  	/* all the device entries on the same pin have the same conn list */
> -	per_pin->num_mux_nids =
> -		snd_hda_get_raw_connections(codec, pin_nid, per_pin->mux_nids,
> -					    HDA_MAX_CONNECTIONS);
> +	per_pin->num_mux_nids = conns;
>  
>  	return 0;
>  }
> @@ -1713,9 +1722,6 @@ static void hdmi_repoll_eld(struct work_struct *work)
>  	mutex_unlock(&spec->pcm_lock);
>  }
>  
> -static void intel_haswell_fixup_connect_list(struct hda_codec *codec,
> -					     hda_nid_t nid);
> -
>  static int hdmi_add_pin(struct hda_codec *codec, hda_nid_t pin_nid)
>  {
>  	struct hdmi_spec *spec = codec->spec;
> @@ -1790,8 +1796,6 @@ static int hdmi_add_pin(struct hda_codec *codec, hda_nid_t pin_nid)
>  		per_pin->dev_id = i;
>  		per_pin->non_pcm = false;
>  		snd_hda_set_dev_select(codec, pin_nid, i);
> -		if (spec->intel_hsw_fixup)
> -			intel_haswell_fixup_connect_list(codec, pin_nid);
>  		err = hdmi_read_pin_conn(codec, pin_idx);
>  		if (err < 0)
>  			return err;
> @@ -2603,24 +2607,6 @@ static void generic_acomp_init(struct hda_codec *codec,
>   * Intel codec parsers and helpers
>   */
>  
> -static void intel_haswell_fixup_connect_list(struct hda_codec *codec,
> -					     hda_nid_t nid)
> -{
> -	struct hdmi_spec *spec = codec->spec;
> -	hda_nid_t conns[4];
> -	int nconns;
> -
> -	nconns = snd_hda_get_raw_connections(codec, nid, conns,
> -					     ARRAY_SIZE(conns));
> -	if (nconns == spec->num_cvts &&
> -	    !memcmp(conns, spec->cvt_nids, spec->num_cvts * sizeof(hda_nid_t)))
> -		return;
> -
> -	/* override pins connection list */
> -	codec_dbg(codec, "hdmi: haswell: override pin connection 0x%x\n", nid);
> -	snd_hda_override_conn_list(codec, nid, spec->num_cvts, spec->cvt_nids);
> -}
> -
>  #define INTEL_GET_VENDOR_VERB	0xf81
>  #define INTEL_SET_VENDOR_VERB	0x781
>  #define INTEL_EN_DP12		0x02	/* enable DP 1.2 features */
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
