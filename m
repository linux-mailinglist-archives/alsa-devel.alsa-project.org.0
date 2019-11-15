Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EEEFD9B5
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 10:48:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25CEA1668;
	Fri, 15 Nov 2019 10:47:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25CEA1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573811288;
	bh=+lb8ZiU21orkDO19uX+hdJWqFYrmZtbaqRDtCVjKVZk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rckMLhF6yTVZJR2HlImdw6ZElJsnOllR3qun+ieJDeN9LOZY8EA42xo990nX6luP+
	 jTzC1+UHK7OVSWl+AP0AJysVI3QFUtnueOppR0LYjHnFAXTVLN3SFJtW0c30s4ZeKt
	 qAfTOljRq/dPSXyaJk+FqM7nWb06Kxj9fxuDczxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69269F80102;
	Fri, 15 Nov 2019 10:46:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47062F800CC; Fri, 15 Nov 2019 10:46:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 336DCF800CC
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 10:46:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 336DCF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="hO2EJZI8"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dce73e70000>; Fri, 15 Nov 2019 01:46:15 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 15 Nov 2019 01:46:16 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 15 Nov 2019 01:46:16 -0800
Received: from [10.24.218.121] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Nov
 2019 09:46:14 +0000
To: Takashi Iwai <tiwai@suse.de>
References: <20191114033704.18171-1-nmahale@nvidia.com>
 <20191114033704.18171-3-nmahale@nvidia.com> <s5hpnhun2yc.wl-tiwai@suse.de>
From: Nikhil Mahale <nmahale@nvidia.com>
Message-ID: <eb7ffe9f-487f-1ef4-1c79-adbf3a1c4eb0@nvidia.com>
Date: Fri, 15 Nov 2019 15:16:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <s5hpnhun2yc.wl-tiwai@suse.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573811175; bh=k14AnpCndB8VUQ/BuO5jik/VJlXk9lNdj3rgman4V8w=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=hO2EJZI8vF2/50ubAOzkSFefpCTZTnfkzUaso4EwEfVKD9oSFT9cpxfobao24eG+y
 U2a7/wVWvTAY7G3g/Ea67C/xv2oyfha4HHXlHlb/W9vnMHj3BVzdkQ59pQwECZFYka
 F8cD3mpLnFVyE/zVl11zZh5nCIT8/mXVCPbpKUDSGLWLDWPlkNJv+6Ck3QH8oCxhsB
 5HIg7sECxDrrc6z3FDgWmYZkByeIExj59y4XI02hTuv9e1jyy3iX6dxqyKcF5tdcGZ
 7PnOi5uLjxw/Cggqupvc5o+9RjwDNrAa6FXik/A3kmW2TECPOA4TiM4DhfevSL2vpJ
 SkNjf9EfB3o2A==
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, aplattner@nvidia.com
Subject: Re: [alsa-devel] [PATCH v1 2/5] ALSA: hda - Add DP-MST jack support
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

On 11/14/19 4:24 PM, Takashi Iwai wrote:
> On Thu, 14 Nov 2019 04:37:01 +0100,
> Nikhil Mahale wrote:
>>
>> This patch adds DP-MST jack support which will be used on NVIDIA
>> platforms. Today, DP-MST audio is supported only if the codec has
>> acomp support. This patch makes it possible to add DP-MST support
>> for non-acomp codecs.
>>
>> For the codecs supporting DP-MST audio, each pin can contain several
>> device entries. Each device entry is a virtual pin, described by
>> pin_nid and dev_id in struct hdmi_spec_per_pin. For monitor hotplug
>> event handling, non-acomp codecs enable and register jack-detection
>> for every hdmi_spec_per_pin.
>>
>> This patch updates every relevant function in hda_jack.h and its
>> implementation in hda_jack.c, to consider dev_id along with pin_nid.
>>
>> Changes to the HD Audio specification to support DP-MST audio are
>> described in the Intel Document Change Notification (DCN) number
>> HDA040-A.
>>
>> >From HDA040-A, "For the case of multi stream capable Digital Display
>> Pin Widget, [the Get Pin Sense verb] can be used to read a specific
>> Device Entry state as reported in Get Device List Entry verb." This
>> patch updates the read_pin_sense() function to take the dev_id as an
>> argument and pass it as a parameter to the Get Pin Sense verb.
>>
>> Bits 15 through 20 from the Unsolicited Response for intrinsic
>> events contain the index of the Device Entry that generated the
>> event. This patch updates the Unsolicited Response event handlers to
>> extract the device entry index from the response and pass it to
>> snd_hda_jack_tbl_get_from_tag().
>>
>> This patch updates snd_hda_jack_tbl_new() to take a dev_id argument
>> and store it in the jack structure, and to make sure not to generate
>> a different tag when called more than once for the same nid.
>>
>> Signed-off-by: Nikhil Mahale <nmahale@nvidia.com>
>> Reviewed-by: Aaron Plattner <aplattner@nvidia.com>
>> ---
>>  sound/pci/hda/hda_generic.c    |  16 +++---
>>  sound/pci/hda/hda_jack.c       | 107 +++++++++++++++++++++++++++++------------
>>  sound/pci/hda/hda_jack.h       |  26 ++++++----
>>  sound/pci/hda/patch_ca0132.c   |  24 ++++-----
>>  sound/pci/hda/patch_cirrus.c   |   4 +-
>>  sound/pci/hda/patch_conexant.c |   2 +-
>>  sound/pci/hda/patch_hdmi.c     |  47 +++++++++---------
>>  sound/pci/hda/patch_realtek.c  |  46 +++++++++---------
>>  sound/pci/hda/patch_sigmatel.c |  12 ++---
> 
> So this patch touches quite wide range of code just for passing the
> additional 0.  I prefer keeping the old (non-MST) functions as is,
> while adding a couple of new mst-capable jack function, e.g.
> 
> snd_hda_jack_tbl_get_mst(codec, nid, dev_nid);
> snd_hda_jack_detect_enable_mst(codec, nid, dev_nid, callback);
> 
> etc.  snd_hda_jack_detect_eanble() and *_callback() can be unified for
> MST variant, as it's called only from HDMI codec, and also
> *_get_from_tag() can be extended as it's called only from hda_jack.c
> and patch_hdmi.c.  That is, keep the functions that are accessed
> outside hda_jack.c and patch_hdmi.c should be kept, while adding a few
> for handling dev_id.
> 
> A few more nitpicks:
> 
>> --- a/sound/pci/hda/hda_jack.c
>> +++ b/sound/pci/hda/hda_jack.c
>> @@ -55,7 +55,7 @@ static u32 read_pin_sense(struct hda_codec *codec, hda_nid_t nid)
>>  					AC_VERB_SET_PIN_SENSE, 0);
> 
> Don't we need to pass dev_id for PIN_SENSE verb, too?

As per specification, No. I am referring to section 7.3.3.15 from https://www.intel.com/content/dam/www/public/us/en/documents/specification-updates/high-definition-audio-multi-stream.pdf.

Thanks,
Nikhil Mahale

>>  	}
>>  	val = snd_hda_codec_read(codec, nid, 0,
>> -				  AC_VERB_GET_PIN_SENSE, 0);
>> +				  AC_VERB_GET_PIN_SENSE, dev_id);
> 
> 
>> --- a/sound/pci/hda/patch_hdmi.c
>> +++ b/sound/pci/hda/patch_hdmi.c
>> @@ -784,24 +783,18 @@ static void hdmi_intrinsic_event(struct hda_codec *codec, unsigned int res)
>>  	struct hda_jack_tbl *jack;
>>  	int dev_entry = (res & AC_UNSOL_RES_DE) >> AC_UNSOL_RES_DE_SHIFT;
>>  
>> -	/*
>> -	 * assume DP MST uses dyn_pcm_assign and acomp and
>> -	 * never comes here
>> -	 * if DP MST supports unsol event, below code need
>> -	 * consider dev_entry
>> -	 */
>> -	jack = snd_hda_jack_tbl_get_from_tag(codec, tag);
>> +	jack = snd_hda_jack_tbl_get_from_tag(codec, tag, dev_entry);
> 
> Passing dev_entry unconditionally might be broken on old HDMI codecs.
> Pass 0 if codec->dp_mst is false.
> 
> 
>>  	if (!jack)
>>  		return;
>>  	jack->jack_dirty = 1;
>>  
>>  	codec_dbg(codec,
>>  		"HDMI hot plug event: Codec=%d Pin=%d Device=%d Inactive=%d Presence_Detect=%d ELD_Valid=%d\n",
>> -		codec->addr, jack->nid, dev_entry, !!(res & AC_UNSOL_RES_IA),
>> +		codec->addr, jack->nid, jack->dev_id, !!(res & AC_UNSOL_RES_IA),
>>  		!!(res & AC_UNSOL_RES_PD), !!(res & AC_UNSOL_RES_ELDV));
>>  
>>  	/* hda_jack don't support DP MST */
>> -	check_presence_and_report(codec, jack->nid, 0);
>> +	check_presence_and_report(codec, jack->nid, jack->dev_id);
> 
> This comment is invalid.
> 
>> @@ -831,11 +824,12 @@ static void hdmi_unsol_event(struct hda_codec *codec, unsigned int res)
>>  {
>>  	int tag = res >> AC_UNSOL_RES_TAG_SHIFT;
>>  	int subtag = (res & AC_UNSOL_RES_SUBTAG) >> AC_UNSOL_RES_SUBTAG_SHIFT;
>> +	int dev_entry = (res & AC_UNSOL_RES_DE) >> AC_UNSOL_RES_DE_SHIFT;
> 
> Ditto, let's pass 0 for !codec->dp_mst.
> 
> 
> thanks,
> 
> Takashi
> 

-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
