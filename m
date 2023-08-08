Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 565D6773AFC
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 17:26:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BA5E1DA;
	Tue,  8 Aug 2023 17:25:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BA5E1DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691508384;
	bh=FaB3Urzm+VcIJfVmiORCiy80HZgUixxojID71a2oTNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TI7FykGeSLhhK5X6HFgH0/0hIdj5maL5zuVgAvywDMi4Rfu7NFENierXXTprz8Ykk
	 E/dQWOQzRZP1QQLuguNyeLmYWZrbqBUeYdzHG3HZqkwTXCyCMzokCcGtP1eVNOOB42
	 PoIu1wPJ1FYkzZ79ZsOjJ14ajvgZQZDGav2c2cDY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F86CF80154; Tue,  8 Aug 2023 17:25:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E0AEF80154;
	Tue,  8 Aug 2023 17:25:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8334AF80534; Tue,  8 Aug 2023 17:25:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CFB2F800B8
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 17:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CFB2F800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=MYUyKt2M;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=oWL24S/s
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 3ADB65C0172;
	Tue,  8 Aug 2023 11:25:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 08 Aug 2023 11:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1691508316; x=
	1691594716; bh=aAh/iKVy2MSHbwdbnrFp7WOY/1iiSzIOdVd9Dhe/wtc=; b=M
	YUyKt2MY7tRd0AIWSXF8R9dB4FQk04UVmJZQvaSfvoRXMEhj3uLUkNz57jTzfuOJ
	zl/WbY7YLt+/IeuCq4Urw3fE+7MBGoA8dPDdxxZb9mpqfv6XxTHR2Ede02z9h/Fa
	ViKff6iWyyI26LbGlRiTxLtMmSDV4lzZ86XEtEg1shQjpKtPPRF3ZIl2TSmVkkwf
	/QQ03/L8zMBXfWx66WNxbQZ+ql+5F+ih8aU3ZUxao6Hx1IwbiYxHMrXZ/ayPQeJY
	iFi1mpsebHXoUcCICLvjkWGcpsCCUCo/7Vw/Bot0j0IexiGqGzpRsxGg7u2N7CTM
	MjWIYANPwlrXQv4Ji5aHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691508316; x=1691594716; bh=aAh/iKVy2MSHb
	wdbnrFp7WOY/1iiSzIOdVd9Dhe/wtc=; b=oWL24S/skojZ11P7lI+Hn3/LwiIgv
	KpnD04+zNm61d7LVJQh4TuqzZ7/fFyVdC00j8WI21iZkoeJDZ+GO9YUDfrAqyVsb
	2O2xcgA1TUUQmt0tMOZeNEsYrTbWzs5mNCoSagTFKIgsP3zKQBRzX3IDA53MPvjT
	DfVw1ckEQ4UG7w//UjjGNPafI3aT7o2vY4Aqn0+2qo+lnM0JzZFuNu2JuV11+Vmh
	LKi0UWg3y1tG6rcxNbt10fa/AXRnJZJtFxwWcqamatR5viHxXG94L6fJKPrSqvOf
	BpxKguOSteffFxEixSKDMoX3N/1cqmnRoVFEsBZmdjJ6ri8Wy1K4TAXaw==
X-ME-Sender: <xms:W17SZKVlR0bahwKvw2H7JfRVjjAGqqEYq6SwumbX82Lh3NOYyBNfEQ>
    <xme:W17SZGmhyiNqYm2Qzk8t3kIZIh5Cpku9i8LwueBkpjHagbmjAphG7jYvMsozOGjUu
    Az2OX4ROO53LMaI3Fs>
X-ME-Received: 
 <xmr:W17SZOZndxw0K23mEA8IeMLD_HZS_a3-o4q5Yq8ID2h5yxYEY2mUKb2MteJMlus77vSW0IwvMzu5DvKgGrmfSRNd7frzPVpoLg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrledvgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpeekvdfhtdefffevgffggeffvdfhuddvueekgedtjefh
    fedtkeehtedvtdejgfeuhfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgtrhgvrg
    htihhvvggtohhmmhhonhhsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:W17SZBVNG-eBzbFx9_YagiAj53cGxyuWWZJDk8zb0WwnxX-O1eOcpQ>
    <xmx:W17SZEl0gG-nhM6lMqytDPsqgnfPIqXwymzAq7h5d-NnRmT4MnvzVw>
    <xmx:W17SZGe1XeRwtBGuer_QG5WsTQY9fjoAhMh18m_svStEeZuQRQcqVQ>
    <xmx:XF7SZOjASrpHnDJ91fMX4zNCuhFDLwbWEZb6TyJTCADtEzX7j1VSrA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Aug 2023 11:25:14 -0400 (EDT)
Date: Wed, 9 Aug 2023 00:25:11 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Michele Perrone <michele.perrone@weiss.ch>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
	Rolf Anderegg <rolf.anderegg@weiss.ch>,
	Isabelle Kernhof <isabelle.kernhof@weiss.ch>
Subject: Re: [PATCH] ALSA: dice: add stream format parameters for Weiss
 devices
Message-ID: <20230808152511.GA729027@workstation.local>
Mail-Followup-To: Michele Perrone <michele.perrone@weiss.ch>,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
	Rolf Anderegg <rolf.anderegg@weiss.ch>,
	Isabelle Kernhof <isabelle.kernhof@weiss.ch>
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20230728131308.GA142765@workstation.local>
 <7a0cf3fd-9e31-45e1-7aa4-97cab27dafa7@weiss.ch>
 <20230731140655.GA367100@workstation.local>
 <81450de2-3bf5-cb96-114f-6d75314e5a03@weiss.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81450de2-3bf5-cb96-114f-6d75314e5a03@weiss.ch>
Message-ID-Hash: EACILFJ2AIK73WI2ZLJ5BGLGYQJP4ANS
X-Message-ID-Hash: EACILFJ2AIK73WI2ZLJ5BGLGYQJP4ANS
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EACILFJ2AIK73WI2ZLJ5BGLGYQJP4ANS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Tue, Aug 08, 2023 at 10:34:38AM +0200, Michele Perrone wrote:
> Dear Mr. Sakamoto,
> 
> sorry for the late reply.
> 
> I was aware of the fact that you maintain the Linux Firewire subsystem,
> but I didn't know about the deprecation notice, so thanks for sending it.
>
> So if I understand correctly, 2029 will be the last year when Firewire
> functionality is supported by Linux? Does this mean that Firewire
> functionality is going to be removed altogether after that?
 
Let me avoid professing about it, but it is better not to continue using
Linux FireWire subsystem anymore beyond the 3 years migration period.

> Back to our devices - our firmware doesn't support TCAT protocol extension
> unfortunately. That's why I had to write this patch in the first place:
> only 44.1kHz and 48kHz could be selected.
 
Okay. I'll post the revised version of patch to the list, then requests
the maintainer of sound subsystem to apply it to his tree for v6.5-rc6.

> About AVC, I had noticed your 'snd-firewire-ctl-services' project before.
> I also compiled it and played with it, but since I was able to re-use our
> old kernel-space AVC code with relatively little effort, I am currently
> working on that option.
> Nevertheless, I would be glad to assist you and making Weiss devices
> supported by 'snd-firewire-ctl-services'.

As a policy to maintain current ALSA firewire stack, any code for control
function is out of kernel land, thus your AVC function can not to be
merged to Linux upstream as is.

I think the most convenient way is to provide source code for the
AVC function to me. Then I re-implement it by Rust language for
snd-dice-ctl-service program. As long as interpreting original code, we
have no license issue for the new code.

But As a first step, I would like you to assist my support for DICE common
controls in your models. When ALSA dice driver is loaded, it adds an
procfs node to dump information by TCAT general protocol, like:

$ cat /proc/asound/card2/firewire/dice
sections:
  global: offset 10, size 90
  tx: offset 100, size 142
  rx: offset 242, size 282
  ext_sync: offset 524, size 4
  unused2: offset 0, size 0
global:
  owner: ffc1:000100000000
  notification: 00000010
  nick name: DesktopKonnekt6
  clock select: internal 48000
  enable: 0
  status: locked 48000
  ext status: 00000000
  sample rate: 48000
  version: 1.0.4.0
  clock caps: 44100 48000 88200 96000 176400 192000 arx1 arx2 internal
  clock source names: Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\INTERNAL\\
...

I need the `clock caps` and `clock source names` fields to implement the
common controls for your device in snd-firewire-ctl-services.

> Is there something else that you would need, apart from the configuration
> ROMs? And also what is the preferred way for sending you the ROMs? Should
> I open a pull request on your 'am-config-roms' repository on GitHub?

I don't mind which way to use.

In my point of view, we need to decide license under which the file of
configuration ROM image is public. I think CC0[0] is bette for our case.

I'm planning to move the repository under git.kernel.org, and have talked
with admin about it. The admin said that I need to declare the license
of included files. I'm under re-classifying these files and not finished
yet.

So when you contribute the files for your models, please use CC0 by
declaring in commit/request message.

[0] https://creativecommons.org/publicdomain/zero/1.0/


Regards

Takashi Sakamoto
