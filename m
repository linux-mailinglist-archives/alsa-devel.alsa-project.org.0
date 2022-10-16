Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 831755FFCEC
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 03:38:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DABE7493F;
	Sun, 16 Oct 2022 03:37:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DABE7493F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665884298;
	bh=PPWgHhZbcDg7ibdjbh2RS02RQ+zil2LhiDJSGEk7EUg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SJOxqsiqwOYsi42FgMAiKdgMZ7h01fxVZehSFOnSBB35xZwxGZUggnfmy1KvMU94+
	 AbWNqEX+wBC34a6FFQJ4WJ/DvBMB4Zx2E4NI82WI6LPHn0S0tLp2Kfvf3ZNFhCYR5j
	 ynUqwn3PJJtjRFFXemCxlC+JpKIuZXNM6ya7AoJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BD03F80212;
	Sun, 16 Oct 2022 03:37:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C66FF801F7; Sun, 16 Oct 2022 03:37:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_59,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E063F80086
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 03:37:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E063F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="D1iA3Gfp"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="gI8Q9Mae"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 5EB0132004ED;
 Sat, 15 Oct 2022 21:37:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 15 Oct 2022 21:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1665884229; x=1665970629; bh=us
 mHFGZvtUt3GSrq2Da8mcGY9SS5vOoXDl/cCx8LI4E=; b=D1iA3Gfp6IRKKyYKla
 BGRWT6HV5ORZH3XntIHzxDDGMqcVx7p2s3/kC6hjta14oSTfn+j9WyjmvvuVyxPB
 sx+IYrSNRlm977dUesZ0Hvv3gFIQ4sZbhyNPCf+ylitZCHlmnOhe2adbvv0D/zqW
 mSD+VzB1UNtvf4FYjxm/XCpLfR/rzAJcQ7k9R8VkCBHuYvmF/MG2eyA19eKzxmO5
 a8wLo32zN19JGyDI1dEFqZ4rhskaodQybEtQJ6SRc0348495RxwNpKBuQK1W1AMw
 r2VcqR4K1Oy5i+ptOTf4Lh/ssHCBsh6+xLfS6CK4Ln8TkbZGHYM5b8RORNdYFtAV
 RwCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1665884229; x=1665970629; bh=usmHFGZvtUt3GSrq2Da8mcGY9SS5
 vOoXDl/cCx8LI4E=; b=gI8Q9MaeKVW5znaEdWUAn1R/4/m8GhHiqlrdrdkIECPV
 VbGrYV36EbOjjZkAoGw2s3xv1enK+b+y1oyyrlQFY42TZ0m5WmY+b5SepEihJqwG
 J4Vk3u607VvjrQVgEObD0mCwSDBO4vF2eaH0gYz11YdUfA+5Bs+1X5KkaIjxM5fy
 gV4Wo7UuhWYTkHzm6zfrb7RgJiY4HMOg815V3x/+vssDb7pBY/gLkFeNcmq3tfZp
 WQTwKjlsbZsOTAiORlfb4k9Cy6rSEjTz1QNq7FLmhji6H06cqAOmkwS+LYTAGjip
 kk8kLOsMXmh6q6lV5pHx4C2LTqH1YcSL7xapIu/PDw==
X-ME-Sender: <xms:RWBLY8RnzOVWus9YllghGCXsdDG_F36upd0Nj22k79zJzbq07jihfw>
 <xme:RWBLY5xi6GXxPEKzUcMU6SxX5vDJE5NSAIaIw5mJuRztnCKRz4l5TVfC7xISl47Ph
 S7nKj1jh8tfK1BdYws>
X-ME-Received: <xmr:RWBLY518ulMsXKM94RXlbP3nvJuWy21yTj55IS3qwOJ5Ux7EkkaRrx1VzU7acdMkZ26XPpOJz3SFCfHpMJe8hUaH2SrvbHFPwFqN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekhedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhepgeetuddtgffhfeeuiefggeeljeeuleelteelgfdu
 gfdtkeeiffetleeugfdtffejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdprghrtg
 hhihhvvgdrohhrghdpudefleegthgrrdhorhhgnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthh
 hirdhjph
X-ME-Proxy: <xmx:RWBLYwCJ-30EGDlAe1yFn39CNlCh2PY56FBnt221LYQawXE6_1UA-A>
 <xmx:RWBLY1gZcym1328Ugoc_pGuOzJE__MX2wCdW5zUdk_MGuOetwCrfdQ>
 <xmx:RWBLY8p2zTyh9ijua02YkuSLSfhQOrvwa1kRBHzeEl2hVNIVMHWMqw>
 <xmx:RWBLY4v5FuNZxCTlhwq8tozncg2jAyYH0XNyNo5R70CXmrN7q7-bfw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 15 Oct 2022 21:37:07 -0400 (EDT)
Date: Sun, 16 Oct 2022 10:37:05 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: George Hilliard <thirtythreeforty@gmail.com>
Subject: Re: [PATCH 0/2] sound: dice: Firestudio Mobile
Message-ID: <Y0tgQah2qTmOt6KA@workstation>
Mail-Followup-To: George Hilliard <thirtythreeforty@gmail.com>,
 Clemens Ladisch <clemens@ladisch.de>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20221015233330.8679-1-thirtythreeforty@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221015233330.8679-1-thirtythreeforty@gmail.com>
Cc: alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>,
 linux-kernel@vger.kernel.org
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

Hi,

On Sat, Oct 15, 2022 at 06:33:28PM -0500, George Hilliard wrote:
> This short series adds a configuration block for the Firestudio Mobile I
> just acquired.  Very similar to the Firestudio, but a lower port count.
> 
> My understanding is that the Low, Medium, and High speeds refer to
> 48kHz, 96kHz, and 192kHz sample rates, of which only the first two are
> supported by this hardware line.  Please correct me if this is not
> correct.
> 
> Thanks!

Thanks for the patches, while the device, FireStudio Mobile, is
already supported by ALSA dice driver since it has an entry of moddevice
table which matches your device:

```
	{
		.match_flags = IEEE1394_MATCH_VERSION,
		.version     = DICE_INTERFACE,
	},
```

I think you have the other troubles except for device detection.


In general protocol defined by TC Applied Technologies (the company
which designed DICE ASICs and firmwares), two fields of content of
configuration ROM have pre-defined values.

One of the fields is version field of unit directory. The value is
0x000001 (=DICE_INTERFACE). In your case, the content of unit directory
is below. We can see the value of version field is 0x000001.

```
               unit directory at 430
               ---------------------------------------------------
430  00048030  directory_length 4, crc 32816
434  12000a92  specifier id: Presonus Corporation
438  13000001  version
43c  17000011  model
440  8100000f  --> descriptor leaf at 47c
```

Another is EUI-64 field in bus information block. the part of field
is used for 8 bit `category ID` and the value is 0. In your case,
the value is below. The way to parese the field, please refer to
`check_dice_category` function in `sound/firewire/dice/dice.c`[1].

```
               ROM header and bus information block
               ---------------------------------------------------
400  0404bc6a  bus_info_length 4, crc_length 4, crc 48234
404  31333934  bus_name "1394"
408  e0008102  irmc 1, cmc 1, isc 1, bmc 0, cyc_clk_acc 0, max_rec 8 (512)
40c  000a9204  company_id 000a92     | Presonus Corporation
410  047da647  device_id 04047da647  | EUI-64 000a9204047da647
```

For the content of configuration ROM itself, documentation by 1394
Trading Association (vendor association back in several years ago) will
be a great help[2].


As a supplement, TCAT general protocol has no way to share available
stream formats at all of supported sampling transfer frequencies. It
allows software just to read available stream formats at current
sampling transfer frequency, while TCAT protocol extension has the
function.  ALSA dice driver is programmed to try the extension to detect,
then works at limitation mode at failure. The pre-defined table you coded
is for the case that the extension is not supported by device, but
your device supports the extension.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/sound/firewire/dice/dice.c#n33
[2] https://web.archive.org/web/20210216003042/http://1394ta.org/wp-content/uploads/2015/07/1999027.pdf


Thanks

Takashi Sakamoto
