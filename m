Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A81169B2A
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 01:22:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53D7F1688;
	Mon, 24 Feb 2020 01:21:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53D7F1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582503746;
	bh=QpnzDW3PJ6gOZaiGPBTCBG9E6kja+0iaU4MMLfBspJc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FxE9XCo8qSzqxDT/VFUeiEq3efHhkYEtzSMRrH3ewq/6ludInRk3Q2WGYH/MUkLdc
	 cViUSW5KW8Rhhk1s9pYZErXuZYhd1z1+tcaqazDPiarrBANq6YKX0F4uhJEYirzVSt
	 0Xu4wy5AQ4ZL4fIwZpy7SWEK4APPt9BEept1RFEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5848CF80143;
	Mon, 24 Feb 2020 01:20:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 555B7F80142; Mon, 24 Feb 2020 01:20:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19670F800C6
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 01:20:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19670F800C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="xPjqy5Zx"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="kYZ7cfDx"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id F11E920F51;
 Sun, 23 Feb 2020 19:20:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 23 Feb 2020 19:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=QGy6mwgMxS/UXPDoQAeZGqZqNp7
 g5A4zYM41BXCFU1U=; b=xPjqy5ZxYhaoWKhaNHEZyIM6EYHFyCQgkatoczqBzMP
 Veytg+0MFrefbC4T48jpTjItJx0YJRmjbpP7j3lAFExSRgrWGtGmN7nnIlm9X8Bf
 61AeCtEhRgQ81N+tZ0+iSPlQCGjUWyxEJkYHgIqqcUqmC1yUNKfXbO2OMzwWvk/L
 hb//3Gm66BoaylG/j3PShc/Ev7aKNk5YMhArW6xyZVRSMWgsqpsXuH382g/2e0Ya
 Sn9xZA42x+mbZWkkW3e1VBejcfLffM7Bn9XX9ktkYZlljSjVlKlmL49Q6q0T+Dvc
 2NxGpcWq8mwvtlek2u9q1orojwdSbUkOZRz8Bd8oVdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=QGy6mw
 gMxS/UXPDoQAeZGqZqNp7g5A4zYM41BXCFU1U=; b=kYZ7cfDxgfAn7trl9fUH+D
 r7AY9Bc5D6jzCE5zLhaG6mny7IbtlUWzLMIbhj4vmKh3MZcJxpKsNaVe8JFPzr4P
 J2VQOvBNdkHLXx2RzhgiQqVL9qxvG1bplJ8AG3Gdyw3vzeSt7Dyhriv2Ovyvx+N4
 5lbSeHmqE9u0/YByz/ZpjLlX7PbHclOuuxIlj10N8m5/0usyOGbHXv4Dl7RSSHEm
 V+Mzf+NaXjUYL2qR0+sKmeB46cePgnnMktHx81rCvIYEvbHaCad0TSsl/uqdIR4v
 rvd6phmciHYVjH6d8inXw+BcYLpnC7bpoqUNFkxNWWoJFx+NdSILDtEjYKt3WPww
 ==
X-ME-Sender: <xms:1BZTXsePiB4yYVCbZh-OnmJ9dm8Zq0ToAO_8rm9F_crBh4IHDT83eA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeelgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjfgesthdtre
 dttdervdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedvudekrddvvdehrdduhedurd
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdq
 thgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:1BZTXif36m_YN7yITK9DGSi_O-eZ8dOBuEVZF2-pLCRYJWYGMCpuxA>
 <xmx:1BZTXogytyz708JaP-WTo0e9Jk78hfwvmF6IdPQTM7OyUcOGmgJg8g>
 <xmx:1BZTXmS9xTXBHhyVmU-aDBUlTgumMbxG0oCQXSKCj_sxf7Lc6YFKgA>
 <xmx:1BZTXno_TwPlNUD9SkwqCSu4T517KGSBurna6GMgeIV7FTaI3UPeoQ>
Received: from laptop (g6.218-225-151.ppp.wakwak.ne.jp [218.225.151.6])
 by mail.messagingengine.com (Postfix) with ESMTPA id 33BF83060F09;
 Sun, 23 Feb 2020 19:20:35 -0500 (EST)
Date: Mon, 24 Feb 2020 09:20:32 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Mathias Buhr <napcode@apparatus.de>
Subject: Re: snd_dice: Clicking artifacts with TC StudioKonnekt 48
Message-ID: <20200224002031.GA10405@laptop>
Mail-Followup-To: Mathias Buhr <napcode@apparatus.de>,
 alsa-devel@alsa-project.org
References: <921a3b13-b44e-3300-bb72-84cbc9e3dd88@apparatus.de>
 <20200222012510.GA4883@laptop>
 <e29617da-9d34-c99f-f425-5d2aef59b623@apparatus.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e29617da-9d34-c99f-f425-5d2aef59b623@apparatus.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
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

On Sat, Feb 22, 2020 at 05:49:29PM +0100, Mathias Buhr wrote:
> Thanks for your reply Takashi! It clarifies the situation. I'lll stick
> with ffado then.
> 
> Regards,
> 
> Mathias

Both of libffado2 and ALSA dice driver have problems for each, but it's
a convenient option for users of Dice-based devices to use the former,
at present. I've been improved ALSA dice driver for years with the other
drivers, but it doesn't bring so hasty changes since it's a kind of
reverse-engineering; no one knows the actual design and few ones can
make discussion based on the fact.


Well, I also own TC Electronic Sudio Konnekt 48 and I've investigated
its protocol to configure I/O routings on internal DSP. After my
vacation, I'll send information about it for your convenience
(maybe next week).


Regards

Takashi Sakamoto
