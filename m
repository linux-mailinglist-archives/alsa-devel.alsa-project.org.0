Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EE768E9EF
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 09:35:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CD5182B;
	Wed,  8 Feb 2023 09:34:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CD5182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675845314;
	bh=2oAzgFVIHohjOqZ/o96N6xOmvtqNj9lMcans/gTTlKk=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UddDsOY5zEJPmTKs9l6TFycsH9+y0oO7b157dDhOCIPVtt2je6Fr+8gbetyOpE6ar
	 eEgotDHHjB1pHCqY91eGieNldzh0wSadPLUPgeQziBboTVIi7YJT6H7iRwZTIvHVKa
	 XcXzq9/Z+EIj2Q4M8EY7ZUvFB4gR3Oh6xzz2l9zQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0F4EF800E2;
	Wed,  8 Feb 2023 09:34:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4430BF8012B; Wed,  8 Feb 2023 09:34:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1039EF80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 09:33:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1039EF80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=yMaUdS+a;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=DPWWMLRf
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id D48CD5C0072;
	Wed,  8 Feb 2023 03:33:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 08 Feb 2023 03:33:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1675845234; x=
	1675931634; bh=jukRv2y1xt9Uct7GPytfpJjy5G82Ak1THGb0pVwupSk=; b=y
	MaUdS+a0CTiq9wEFVIKTlIcX6qaKtsUGQqpQDpuKvgJV0zbEfcqoTCeXMuRP23WV
	NBmPljneI3tPYtDlgOuSgBg5rVHcnbF5mosJFpAKlYG1cfp7SiewCBKXHMELgUui
	0HlnlVkgujKNWpHp2EZsQEfNgOsB/WulnsyNVLYLhVJG3qKTDxEBbzOJJU8lVk6r
	Of7/RKXbxiW0WDHPmy5Yd1oS+N65oXVipuq6Vs7scxLwIQ31wBeT/wrwU2S6c74K
	rzpbAfA2KwtQCNJMg7zrOYQS41rJu0c1FjnuP5X3dF8RjcOj0x/DzCrsWuvZAeAH
	W5AslNJPEnWfL85F2HQpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1675845234; x=
	1675931634; bh=jukRv2y1xt9Uct7GPytfpJjy5G82Ak1THGb0pVwupSk=; b=D
	PWWMLRfuim1VO+n+LmGYnpfrCUG2ISKP8EStW4KqUz95X60TYknJm4QgZbC5jetY
	KXS8Kuw7mxYcamXzTvcVsgGYE5SZKVYX5DhZF+kglLFZVhRO7VFlE0cXdo9rRMHz
	DaqCMy1rR/nMS3Y3pStv10RUTthXTPFzx6tLus7put4GA7u7o6x3RfrvSbJSwhio
	6SCKQtsjS/f4m0+dLXZMCcPFXBu4WLX1zEf+ZFren+uEgp6TTIY/7AfPY4PVmokS
	4/JQgeijKEH9VAPNVpY0G27yKPvDlELbjn/lyKLeEiG4bNoc4QU+rccg6y6MuEwx
	AnNaRDuMAZWVSJ6pmz6ow==
X-ME-Sender: <xms:cV7jYzFq333IxvTrGNU_ToSRZCKZffZ0vILNnYI9Xh-y4HGgZ1wxEw>
    <xme:cV7jYwVZqvxSaRMgJwzkeTBLfGD6zczbFaUsorrIauTe5l8DaaRPygdcTQDxLScZP
    AMgT3IEVV8DWpFtzfI>
X-ME-Received: 
 <xmr:cV7jY1K9fv7a11h1mZF-16L1n7xRN-RtIlS0Qw36LCkaCyHCWN2h8TX_U-Lc-p5cn5QpwfHScsLpCU5rXPdoi5aLa7_uAWzFwG5M>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrudegledguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepvfgr
    khgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthh
    hirdhjpheqnecuggftrfgrthhtvghrnhepgeejteekhfejteeiffelleffhefgieffkefh
    leeujeffkeeiuedvieegfeffieelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghk
    rghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:cV7jYxG0iSLAxmEd8aNTs4cMYykuZDROgUPgZL-QpkxMCaIIuW5NEQ>
    <xmx:cV7jY5W1WGZtWIB8mkolNG6BWfOOvjJF_vzgvZlxhNOvarkoaraK0Q>
    <xmx:cV7jY8PKK2N98zaAP-axpRUjBqLB0LVJhFl1wzCq7iwzKjOuZe8Bhw>
    <xmx:cl7jY0MUpsS_jiG34GdszFPAoJhUMflQBAyIRofAsoC23IJbqWaggg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Feb 2023 03:33:51 -0500 (EST)
Date: Wed, 8 Feb 2023 17:33:48 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/3] ALSA: core: Make some functions return void
Message-ID: <Y+NebPBazKrqJoEZ@workstation>
Mail-Followup-To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geoff Levand <geoff@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>, alsa-devel@alsa-project.org,
	kernel@pengutronix.de, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
Message-ID-Hash: VRINWLNXSD5PDZ5QNR5KU3OUITTFPGHN
X-Message-ID-Hash: VRINWLNXSD5PDZ5QNR5KU3OUITTFPGHN
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Geoff Levand <geoff@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>, alsa-devel@alsa-project.org,
 kernel@pengutronix.de, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-tegra@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VRINWLNXSD5PDZ5QNR5KU3OUITTFPGHN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Tue, Feb 07, 2023 at 08:19:04PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> while checking in which cases hda_tegra_remove() can return a non-zero value, I
> found that actually cannot happen. This series makes the involved functions
> return void to make this obvious.
> 
> This is a preparation for making platform_driver::remove return void, too.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (3):
>   ALSA: core: Make snd_card_disconnect() return void
>   ALSA: core: Make snd_card_free_when_closed() return void
>   ALSA: core: Make snd_card_free() return void
> 
>  include/sound/core.h      |  6 +++---
>  sound/core/init.c         | 40 ++++++++++++++-------------------------
>  sound/pci/hda/hda_tegra.c |  6 ++----
>  sound/ppc/snd_ps3.c       |  4 +---
>  4 files changed, 20 insertions(+), 36 deletions(-)

All of the changes in the patches look good to me, as the return value
seems not to be so effective for a long time (15 years or more) and
expected so for future.
 
Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

One of my concern is that we are mostly in the last week for v6.3
development. When taking influence of the changes into account, it
would be possible to postpone to v6.4 development. But it's up to the
maintainer.


> base-commit: 05ecb680708a1dbe6554d6fc17e5d9a8a7cb5e6a

A small nitpicking. I think you use Linus' tree or so:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=05ecb680708a

Because the hash is not reachable from the branch for next merge window on
the tree of sound subsystem upstream:
https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=for-next&id=05ecb680708a

I guess it is safer to use his tree as your work-base, even
if the three patches can be applied to it as is (fortunately).


Regards

Takashi Sakamoto
