Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A90DF7A1BDA
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 12:15:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6756A4E;
	Fri, 15 Sep 2023 12:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6756A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694772905;
	bh=Yoyoia96zFf7pc3EkO+XUpKhVWsPgcx6Hula+GPXspo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kQegoTAhlriaDHnhd0dvxw5BlMmIkF8FsjAQl5i6Adu8uoBB12kGM5FhbL6mnjJrw
	 469kIPNwL4LB4P8GgCHi8Boz9R+JvFuu7Wnn6PEX6UmIYUpWFQ8D4yXlxXmSMekOhp
	 l1nWAzu37Vyl3uDNatsgt1/LiZI0QIYopnK/tcR8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29B61F8055A; Fri, 15 Sep 2023 12:14:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDF64F8047D;
	Fri, 15 Sep 2023 12:14:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A5FFF8055A; Fri, 15 Sep 2023 12:14:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77F9DF8007C
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 12:14:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77F9DF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm2 header.b=FM6OtPPH;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=F40xsTRk
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 529723200909;
	Fri, 15 Sep 2023 06:14:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 15 Sep 2023 06:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1694772845; x=
	1694859245; bh=+/9n243Kd+TJF7GWxzWl3//BhNaA0LIy0GnM5MVTSWE=; b=F
	M6OtPPHimjWzFLoedmw9V/BZifR/dw2rrUzvYYoRiLgkQ6yGrgt6QXyczaW9p1eA
	J+9XZXR80rRQotIVluXvPzDAAi9JxczocY11uONV6QdbN/5WKqMQB1sRtPofVz8t
	RXdd88VuM/AVQ9rfKvugQSAl37XM5pEJIjINgQOa0wq0DgG05OWoZdOxTcB2a9t5
	XwUUfHG2uw+wjPobqVl+ZvKa03CmWilW7RHCgTFLYOWJGKn/VhgJo9/Ui9L8ea0b
	bjstOIHPvdOPPV0yBCWdAWX09dHZH8rSa+3/ezzVawjhT81/F+1GtBLyh+itAS+M
	eGOkn3IjeiL4Rg8hezDfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1694772845; x=1694859245; bh=+/9n243Kd+TJF
	7GWxzWl3//BhNaA0LIy0GnM5MVTSWE=; b=F40xsTRkxCfTK35a3z6KrKi5X6M8O
	m+JJq/0iXxTaV2V/S1bX4aQmUEZg9Kb5cOS8lsAsaHSd/PiqwCttKfpNv693Ra34
	ppmlVKXz7Hp2SGsBeE6h6igr6hbHVhOMiylr6il27M6zqNXW0G/CZgft6G1H39Hb
	7B5vw7FFooqFWZOW21142FkLIoyrfqG486vwOJFIITIRNDkU7NtKyKUwfnyscg2V
	5l32c6Q8OKuWXqp1mWV7AbVIS3ju66ZWrZ5dON4k1q5RwGmFH6jUXNnrHTyu17+G
	xvJzkoPgqMGWMsulYBrRCg2fcwknpOMiqNcmNzaaAwIDcCXrmXpOPY9CQ==
X-ME-Sender: <xms:bS4EZfrCOemGgCusBSmOtLoqmwlfkcyxwxTwWyGCyHg46s89a9Kkqw>
    <xme:bS4EZZq8MgVqZoTjeGRBFl8TrGI8-yf-zPjYGqaDkGJqlf7a6f2-P2WJd7UOy6wqf
    Hv8r0msdrwspcy0fEA>
X-ME-Received: 
 <xmr:bS4EZcMBZS0htkHmnCCsnuGwi2W67vALci4OXLMze5MNJDU_baexV1c3-CLOG8qJ6hoveTCjRLMxZnNzYVWkPPaNq3t_jSQhGg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrudejvddgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
    ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:bS4EZS5ePhI-VP0FSGjVg8Sjo28taI3zhgLYlyA2yPmzUcnLBC_Y5g>
    <xmx:bS4EZe4x17_LpLe8wbVGuxEDzhBrLcwgr6YbOFEpuwSZrANBie-MpA>
    <xmx:bS4EZaiyyvFqt_OZIScnkRJQQ4HBEd9EN8hMF3k5YzP0JshXd4BuXA>
    <xmx:bS4EZTh0mRxEBldEnZhcgrVPlDqPtzEIOZgEtUZijTuNbAvIBPdl6w>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Sep 2023 06:14:04 -0400 (EDT)
Date: Fri, 15 Sep 2023 19:14:02 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH 11/13] ALSA: firewire: Fix -Wformat-truncation warning
 for MIDI stream names
Message-ID: <20230915101402.GB157572@workstation.local>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20230915082802.28684-1-tiwai@suse.de>
 <20230915082802.28684-12-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915082802.28684-12-tiwai@suse.de>
Message-ID-Hash: SQ7QSN6M5MZ5HSHA4TSO6JDGVQ5F2FW2
X-Message-ID-Hash: SQ7QSN6M5MZ5HSHA4TSO6JDGVQ5F2FW2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SQ7QSN6M5MZ5HSHA4TSO6JDGVQ5F2FW2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Fri, Sep 15, 2023 at 10:28:00AM +0200, Takashi Iwai wrote:
> The compile warnings at filling MIDI stream name strings are all
> false-positive; the number of streams can't go so high.
> 
> For suppressing the warning, replace snprintf() with scnprintf().
> As stated in the above, truncation doesn't matter.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/firewire/bebob/bebob_midi.c         |  6 +++---
>  sound/firewire/dice/dice-midi.c           |  4 ++--
>  sound/firewire/digi00x/digi00x-midi.c     | 14 +++++++-------
>  sound/firewire/fireface/ff-midi.c         |  4 ++--
>  sound/firewire/fireworks/fireworks_midi.c |  4 ++--
>  sound/firewire/motu/motu-midi.c           |  4 ++--
>  sound/firewire/oxfw/oxfw-midi.c           |  6 +++---
>  sound/firewire/tascam/tascam-midi.c       | 12 ++++++------
>  8 files changed, 27 insertions(+), 27 deletions(-)

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Tested-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Thanks

Takashi Sakamoto
