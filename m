Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3311695AC
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Feb 2020 04:56:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAC7016F1;
	Sun, 23 Feb 2020 04:55:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAC7016F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582430173;
	bh=5UnVOm0UiGrg0JYbTKbiVlnyXkcUBx/HK2mfaYgVbi0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZvqguaO2VsLk5ZC0GJIUn2hEGfumP6w2DeXtoEYJ65P/K6nb8+niZjkzXdXSSVJdJ
	 9bJpOJtyzeqABE88AR5RHXifNLX4lDIoVijm0PZm34WEyl1i9Aw6OK+mZhCY4rsOeE
	 oAh1uslS/uSaD7A+wNX/mQPWeW48sSohCd+3JCd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7FECF80143;
	Sun, 23 Feb 2020 04:54:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03496F80142; Sun, 23 Feb 2020 04:54:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04D25F800C6
 for <alsa-devel@alsa-project.org>; Sun, 23 Feb 2020 04:54:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04D25F800C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="eH3O+Uht"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="GyuP/YCv"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id D30BD141E;
 Sat, 22 Feb 2020 22:54:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 22 Feb 2020 22:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=U
 tQ4ZCxViuOYrkl32VfE2T3Vc4NBhu7cH68gein0hZ8=; b=eH3O+UhtcNk39WqG7
 7++FXGFTX+4Z2PcXe3xjcwJsOODd4hxFQavwi0/mUwTIoxG9JBuAOmvs5HQJt990
 QIgs1pI/FaTRd3ev0T4IL+aTvVevCQh7OFSFWKaP/KY94r+EE9D8RHkP90X8PxFC
 oBLmR6XHSy54HBa/H14DQ7lYQ0J/Ydfp27ocjSVODTDsMZjhEZb10ccofds6YtNi
 oaCndzsfnBoKSmoY5aRfQXCd4KQVTdffKFdF/fHmCrQVYwGy8OLV2MowadGuAqHn
 YIqEA+IgJP8fQu88VichUhpYSu9m/bVcLBBWNImzHZQ0a/ObPiE6NmPeg6oxGd8W
 K6ySQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=UtQ4ZCxViuOYrkl32VfE2T3Vc4NBhu7cH68gein0h
 Z8=; b=GyuP/YCv6RLhHx+tybgAMZbAWarsj8Ii4R+BOab0Cw4iOfoJaifZtVc/6
 5Fd1ZIpBORlLHlM5LdItWCbg4TqjJbGHEkASpjlrm+3gGzqj/BwAaZuqBOH0YZxx
 XM34+pmlF976U4TwYysQcVWaDYNCrA75o/b6cM0a0sM3lmw8zmvMMPJXYX3Fpv4I
 yYjTsV717azlzXouTRBaux6jcJMDECw07ZfLymaJ80a20T9FvQsSwAYXw9m6V4Vd
 pFLgMxSD48vcLM7SooibOaf/fbhrA+Hv9V84TE7nSgj9bXlkh7UwPQfclWjLbRGz
 K9IGLkbdVO+s8xbaE9j7kamSgE9ZQ==
X-ME-Sender: <xms:avdRXiuiOsH3o0DSLtQ5DE1m9D-9YuzK8izj4qTuqAIMxZEQ3TuaEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeejgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucfkph
 epjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:avdRXn51utho87JkjiCEVKsYSyaYUpq6F3T40tibOEYao28SHO_3Bw>
 <xmx:avdRXjN-2TXP4CKuwakTE1BqjwcSJb_74ylsLvfxdtvCfcsv01adtw>
 <xmx:avdRXrLkOPwWjIuYPLMnhvX-YnhSwzeK0a3As4WIj5J_T5iK2msXFw>
 <xmx:b_dRXgzcsgknp-tn_3NniTdvYlav4zzWm91Lza6tirW8ghCKDJ3peg>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4E23C3280059;
 Sat, 22 Feb 2020 22:54:18 -0500 (EST)
Subject: Re: [PATCH 5/8] ASoC: sun50i-codec-analog: Enable DAPM for headphone
 switch
To: Chen-Yu Tsai <wens@csie.org>
References: <20200217021813.53266-1-samuel@sholland.org>
 <20200217021813.53266-6-samuel@sholland.org>
 <CAGb2v65v=wPJNxPfOzp2bcevk0qoDiW-+KFBO1MKHz6gE86DPQ@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <f0037c9d-e3b5-3fa9-1f1a-d52d26de3ed7@sholland.org>
Date: Sat, 22 Feb 2020 21:54:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAGb2v65v=wPJNxPfOzp2bcevk0qoDiW-+KFBO1MKHz6gE86DPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Luca Weiss <luca@z3ntu.xyz>, Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On 2/17/20 1:17 AM, Chen-Yu Tsai wrote:
> On Mon, Feb 17, 2020 at 10:18 AM Samuel Holland <samuel@sholland.org> wrote:
>>
>> By including the headphone mute switch to the DAPM graph, both the
>> headphone amplifier and the Mixer/DAC inputs can be powered off when
>> the headphones are muted.
>>
>> The mute switch is between the source selection and the amplifier,
>> as per the diagram in the SoC manual.
>>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
> 
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> BTW, have you also considered tying in the headphone volume control?
> It also has a mute setting.

As far as I can tell, setting a volume control to its "mute" level has no effect
on the DAPM power state. So I didn't add PGA widgets for the volume controls on
either codec. I can add them if there's some benefit to doing so.

> ChenYu
> 

Regards,
Samuel
