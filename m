Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3F0682110
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 01:51:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA7F585D;
	Tue, 31 Jan 2023 01:50:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA7F585D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675126283;
	bh=YyMGcMOQ9OeCMecPmYldY0/lXS1ta5NDthk3JDzgZ9E=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LlCbeAbBVGwqHVb3OYmBAVL1HVW+UAS7qgp3PEh0bdf1ErcuI7j00Pi8HV5OkcY4X
	 1vEHjiadpW9reuNdjozxaXxDoLHRcidS0FoHP9IvLFclzzCHCjUnZ7nlOsXr6iBrNV
	 TtJs4F8+zW72/ylq7pQjs+h4FiYrETnjbY8xHydw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D3E0F80423;
	Tue, 31 Jan 2023 01:50:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DA4BF8032B; Tue, 31 Jan 2023 01:50:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C920CF80155
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 01:50:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C920CF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=EzLEb0NJ; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=YDwuHc4p
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 8E24A5C00EB;
 Mon, 30 Jan 2023 19:50:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 30 Jan 2023 19:50:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1675126211; x=1675212611; bh=7t
 Evx1Wq5hBcE5AoXBcFiR1em1/omSb3W+2cm4SsFBg=; b=EzLEb0NJHKdget6FRw
 lrwscUWU1bgg5OjQD4O5h/3QbwMNtpbwHJzMuaUJRAlDNQv/tqF4iapFRHC3JF/o
 LRW/hCT4R0mPEIcK+Lqdr/OhYQmsetUfLsFreuP0cmU5sEAcg1bRq64lU8K3Bila
 w1Q472SoRxvv1jEp6NlhpKjXb25Q1gSvtwF9Jsg7TvRnPb1K5cP/ay8AokZAntDy
 idLhfk32NTG+rR7CIQP+I+P42NvEdbyqEZl012tcwkIGNdIjJiT10MGnDftkUgP+
 Sin9SQFnhqDakSTdf1NmPp3kzcRZtWK6wUHCg7lsLyEE15qnThb7hHbAdkklVG26
 dp4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1675126211; x=1675212611; bh=7tEvx1Wq5hBcE5AoXBcFiR1em1/o
 mSb3W+2cm4SsFBg=; b=YDwuHc4pMBREvLwGoFKifbXZD7iv6vJFUOLbjH9TlQjS
 uoQQriMUTc3lw9d7X14fsiUfGVkeo0h3RVz3IGxXSpzk6/XwgyM7VpOyBHv2+HwC
 iJxkXrVVvH3LFGj+f3RLsUpjDfZJAEascYrni8oQqlCHANGjmbyqIolMYgmPqxS8
 8M6hUa995ABVmeZbGWblIXA4SVlyXRjAk5Zq6HVcBdXQZc0T8XZ786dG0sBd1eEV
 1mGyM6b8RcRBbSA/8vC98RzsNGUSXnJOdHBTvANDmeeHnA+paN7Tez8WmMAy9wcg
 Ft8GjT+XsvPBEnt6fGKVHqWRoDcaQ8McEsjrSSv3CA==
X-ME-Sender: <xms:wmXYY2QTL5Psv_yD0BxdxKd_mAfiRAh_IjTlAlZl57Jzqzz2QdW9xQ>
 <xme:wmXYY7w1ndaUgu5C-_A5lZhslK6QpGBhzl3n4TsnqdqjSNRPoIQIoDhI5XuNnuSXs
 5KFQzYHOwNUhKe143Y>
X-ME-Received: <xmr:wmXYYz0h5yej8Fg_23aFFt4WA87BwK0rt3w070FcwYYd4H6CZLUw3AJKfzhkKO9YvcJ-GmDL5Lub8zAzAzVwt5RvaQSB_v6vu2rl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeffedgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhepveeilefhudekffehkeffudduvedvfeduleelfeeg
 ieeljeehjeeuvdeghfetvedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:wmXYYyBhZXSWty01-mo8vHp6stQwexso1oBGUpiLUzR0f4ySMxl-PQ>
 <xmx:wmXYY_jeMCoxfETvZKJlOKQUzoxz3duHtNe8EaaAUy8QO5IjBSFCvg>
 <xmx:wmXYY-pbqPwrTAz7aF4A0KVY210cTD7Pdk16tWEMM-H1AHo4ky2_tQ>
 <xmx:w2XYY1YI6d7RbCG4xg3AuAGejCltIiuIgYtO5oq469Iq3XH4BLE0ig>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Jan 2023 19:50:09 -0500 (EST)
Date: Tue, 31 Jan 2023 09:50:05 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH RESEND] ALSA: doc: Fix PCM interface section typos
Message-ID: <Y9hlvUFyic51GPGj@workstation>
Mail-Followup-To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20230130162924.119389-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130162924.119389-1-miquel.raynal@bootlin.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Mon, Jan 30, 2023 at 05:29:24PM +0100, Miquel Raynal wrote:
> Fix two mistakes in the PCM interface section:
> 1/ Members of the snd_pcm_hardware structure are channels_{min,max}
>    and not channel_{min,max} (mind the 's').
> 2/ Another sentence is incomplete as the reference to one structure
>    member (period_bytes_max) is missing.
> 
> There is no relevant 'Fixes:' tag to apply as both typos predate the
> Git era.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> Hello, I wrote and sent this patch in 2019 but I likely only Cc'd Jon
> and the doc ML, which might have not been enough, so just in case, here
> is a resend.
> Link: https://lore.kernel.org/linux-doc/20190829145512.3752-1-miquel.raynal@bootlin.com/
> 
>  .../sound/kernel-api/writing-an-alsa-driver.rst        | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
 
Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Thanks for your long patience.


Regards

Takashi Sakamoto
