Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C215625F4AE
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 10:11:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AA2B179C;
	Mon,  7 Sep 2020 10:10:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AA2B179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599466304;
	bh=Jx8BCE7ZrBDKuhK1OnvckNQilm+OlpYMJY9IzwAVcek=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R69Kse9j1MNoMbeIk2v3IJzx4CZ5xbMPSQ/Ro7tpQ7uk2wiFyW9SCqFezkHxKdos5
	 7w5SdJoXvjzWS9uwT2kw7IMWuNundyk0lV04FDrawGPo32xlKFCrJfWF3gh1gYRjPh
	 N4zJ8qm3EZqn8XXVn3idnflS6386FL/1ROxWXFCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B3AAF8021C;
	Mon,  7 Sep 2020 10:10:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3290F80227; Mon,  7 Sep 2020 10:10:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 793CCF800FD
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 10:09:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 793CCF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="V7oUp+C3"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id A8EB05C00BC;
 Mon,  7 Sep 2020 04:09:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 07 Sep 2020 04:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=eQuPXS
 2sR6GgcAhm7SdOEE0WaUWVIXPviZ+RIpP+MOk=; b=V7oUp+C3QYgF9djvUYnq/A
 6vZa32TwPJJbeX6U/jY2wS/qjohgUh2PpJGg95544fNb2xJ0jc0VrrlVmlH+bDKb
 zQXQGEVj8Tj00aeswPdsj3JqmX50ljLAYD4l8KbLgZgEvRb32iELOoAj9+UGzxcB
 KT89nYnb36isNaoHg2bmck9a2u1TIySMDPEkviXelRirt42KP0lEweX3AJWGj1Av
 BRSiC/xYqGWzcF/ahz3Lnxp+ok9OI4rJfxcnnRSY2NqAAUlz5wsVn47Ew5HY1HkH
 5WYLWeVClRLrKhnOx9KHyIEG7zXKW3l0Tzbj0nZkolKR+9L3hfNxs9acyY6t3SVA
 ==
X-ME-Sender: <xms:x-pVX6a0aJ6nh1CuppdF9HP72VhOfHjD_gcv83ZCE5jl165Zq6qqHg>
 <xme:x-pVX9Yq4Ek413hHq-CUFl6rPwKouWwGe4nf2gSXlPWTchiyRHJ2TwHDVTtk-B5H3
 V9XG3qiVlcR6E0I4sE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehtddgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhuffvkfgjfhfogggtsehttdertdertddvnecuhfhrohhmpefnuhhkvgcu
 lfhonhgvshcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpe
 fgfeefudffhffgueehgeffffeggeevieefueethfeijefftedugfeuveethedtteenucfk
 phepvddtfedruddugedrudeguddrudeinecuufhprghmkfhppfgvthifohhrkhepvddtfe
 druddugedrudeguddrudeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:x-pVX0_ZluNjju3-Jrkb6YOsaxj0jga5GFV3AzKScfGe-ZFybiaUzQ>
 <xmx:x-pVX8rsLopjY1QAFQrNI9FmVxAakZsSvQigrYxhsBMc-sj3PN9tBA>
 <xmx:x-pVX1oSNLH6g_ZlhLE2_70aPOYgjm-3hbzfE7lYj6GryS-hIcSbkw>
 <xmx:yepVX2AHp7-MJEtxztdyTxS2BeCjAWvw6NuqX8R0f6zHsdWlsjdzKw>
Received: from [192.168.20.26] (203-114-141-16.sta.inspire.net.nz
 [203.114.141.16])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1488A3064674;
 Mon,  7 Sep 2020 04:09:39 -0400 (EDT)
Date: Mon, 07 Sep 2020 20:09:25 +1200
From: Luke Jones <luke@ljones.dev>
Subject: Re: [PATCH] ALSA: hda: fixup headset for ASUS GX502 laptop
To: Takashi Iwai <tiwai@suse.de>
Message-Id: <PZ3AGQ.SOCXB34FKYDH1@ljones.dev>
In-Reply-To: <s5ha6y2132u.wl-tiwai@suse.de>
References: <20200906082507.38091-1-luke@ljones.dev>
 <s5ha6y2132u.wl-tiwai@suse.de>
X-Mailer: geary/3.36.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: hui.wang@canonical.com, alsa-devel@alsa-project.org, kailang@realtek.com
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



On Mon, Sep 7, 2020 at 09:03, Takashi Iwai <tiwai@suse.de> wrote:
>>  Signed-off-by: Luke Jones <luke@ljones.dev>
> 
> The SOB doesn't match with From line.  Is it intentional?
I missed this sorry. Have corrected.

>>  -	}
>>  +	}
>>   	else
>>   		alc_fixup_headset_mode(codec, fix, action);
>>   }
> 
> Please drop the unrelated change.
Looks like my vim settings removed an ending white-space. I'll remove 
the change.

> ....
>>  +static void alc294_gx502_toggle_output(struct hda_codec *codec,
>>  +					struct hda_jack_callback *cb)
>>  +{
>>  +	/* The Windows driver sets the codec up in a very different way 
>> where
>>  +	 * it appears to leave 0x10 = 0x8a20 set. For Linux we need to 
>> toggle it
>>  +	 */
>>  +	if (snd_hda_jack_detect_state(codec, 0x21) == HDA_JACK_PRESENT) {
>>  +		alc_write_coef_idx(codec, 0x10, 0x8a20);
>>  +	} else {
>>  +		alc_write_coef_idx(codec, 0x10, 0x0a20);
>>  +	}
> 
> Remove braces for a single if line.  Checkpatch would suggest it, too.
Done

> ....
>>  @@ -7338,6 +7376,35 @@ static const struct hda_fixup 
>> alc269_fixups[] = {
>>   		.chained = true,
>>   		.chain_id = ALC294_FIXUP_ASUS_HEADSET_MIC
>>   	},
>>  +	[ALC294_FIXUP_ASUS_GX502_PINS] = {
>>  +		.type = HDA_FIXUP_PINS,
>>  +		.v.pins = (const struct hda_pintbl[]) {
>>  +			{ 0x19, 0x03a11050 }, /* front HP mic */
>>  +			{ 0x1a, 0x01a11830 }, //0x00a11030 }, /* rear external mic */
> 
> The doubly comments look awkward.  Please reformat it.
Missed this also, sorry :(

> ....
>>  +	[ALC294_FIXUP_ASUS_GX502_VERBS] = {
>>  +		.type = HDA_FIXUP_VERBS,
>>  +		.v.verbs = (const struct hda_verb[]) {
>>  +		    /* set 0x15 to HP-OUT ctrl */
> 
> Please align the comment at the right tab.
Done

>>  +			{ 0x15, AC_VERB_SET_PIN_WIDGET_CONTROL, 0xc0 },
>>  +			/* unmute the 0x15 amp */
>>  +			{ 0x15, AC_VERB_SET_AMP_GAIN_MUTE, 0xb000 },
>>  +			/* set 0x0a input converter to digital */
>>  +			{ 0x0a, 0x70d, 0x01 },
> 
> Use AC_VERB_SET_DIGI_CONVERT_1.
> And, how is this related with the headset fix?  Is this really
> mandatory?  If this widget is really wired, usually the digital I/O is
> controlled via IEC9158 status mixer.
This I'm not actually sure about, I'm sort of fumbling around trying to 
get the rear
mic jack working. I have now removed the comment and 0x0a line so the 
patch is
focused solely on the headset.

Many thanks for the code review. I will submit the fixed version now.

Kind regards,
Luke.


