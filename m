Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BA758A977
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Aug 2022 12:28:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA70215C1;
	Fri,  5 Aug 2022 12:27:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA70215C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659695281;
	bh=rmggmzQ4raVcc7yEJnNH9tfjDQt+EweH8nP+V7vuSIU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DtDQ5IZNd1udJP71Wc8XbV6WarYFJ9j4LI62PYElD14HsOvrxBehPA6dz02snd6ri
	 yYVopMTPKLxmUjszeJoPOq56FbmiYgBUZu2tSrt6H5XJsP3dwbT1An5wD4zUFQ/41C
	 ZUPXCPf57jscLbuCahc2v0KZl9+FJRk7521CgIBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDB96F80271;
	Fri,  5 Aug 2022 12:27:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7501CF8013D; Fri,  5 Aug 2022 12:26:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F8EEF8013D
 for <alsa-devel@alsa-project.org>; Fri,  5 Aug 2022 12:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F8EEF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="N1ryR165"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="LStibbdg"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3E1065C00C5;
 Fri,  5 Aug 2022 06:26:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 05 Aug 2022 06:26:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1659695203; x=1659781603; bh=1k
 H/LuMtnTVH1k/eBcvSWcathXG6uuftCBm+Dbd7oBI=; b=N1ryR1655zkN7VSJ91
 BYqqfeH3Kux55o6iuTOaWBnvqSZN5toLlYZdJNGfEto53QX9IkQU+Obt0K+N0atI
 l6e9dS7jnNWotClvuwvhyoVKDm2pRlO7CtobDTSzy8hVKijuRjJSkS8rMC2OYcYy
 +rTYn0ts1g8Rlbfv9zMo+3+kprmimivLXxC2Qp3tWWP06In4R3e6tcLdQas8LKhH
 8gTTqbUwGYYB3JWoGojfYGRgE86NPl3vlHArpux+jA4e2Ap1nnjaliYJMQJ3ZqVA
 SNw8tU2juZPAIIjIjLMlSbAueX//NObegWZhuweEcMoL2k3S+xdieoQoYIoQ8Kst
 VRJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1659695203; x=1659781603; bh=1kH/LuMtnTVH1k/eBcvSWcathXG6
 uuftCBm+Dbd7oBI=; b=LStibbdgawtVJXgUJx/tY79G2HjECVx0NRpCwKTyMhav
 ByNnRP6Zo86LVe41oc/ZpykftvSsJWQwdZ0Mcbjn4bw5mrd/1nChoipt0jn41mcl
 PioFMM5udD3DvVln+YlRTVXnEogMDRuQbV9U7DiFAYKeh+Mivdap2/z+HKVexa6K
 mP1k7pnFIyvcy93PXlePXJ1aYSR4sObqhmlBmw64D6G88NiHwiOPCXO2i+7Gsri9
 fur4eA6RHqo9JHn/MHb3/ukh5GeI96a+fssSCJngXeuJo1yQo/wCeZzmnvOh3pmF
 8xVvZC57SNRLiiopIZxdVzADvG5en+yhPkKn0veM7Q==
X-ME-Sender: <xms:YvDsYrC5DnZG26NQHS4n0zi1nMXV4oX54ei_DQpwVpTTXWkUeqH5dQ>
 <xme:YvDsYhhMT5Wo7tNULc0UUMcWCDkm-xosld70VZESZLgyOACNjN2IchkCIXSpdtwyg
 dYszseamFOei2dORuo>
X-ME-Received: <xmr:YvDsYmlOob42j7p5sln4flfWxtxfJbAKyCUrVwS4Jkuzh6LuDhsqH7lsI0AeCZ3WwnRSZta7HLTUnMB0ysGC4yqPhUjdSvGl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefuddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 goufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepfffhvfevuffkfhggtggu
 jgesthdtrodttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceooh
 dqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhep
 vdevjeekgedttedvueetvefgleejtdegieevteduheelgeevteeujedvheekjeetnecuff
 homhgrihhnpehgihhthhhusgdrtghomhdpghhithhhuhgsrdhiohdprhhushhtqdhlrghn
 ghdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:YvDsYtwk0LJpUu_kyyrT2Xbkmkh2F6A2hhQOjEFN1iK_6e_N7bQGwQ>
 <xmx:YvDsYgQe0SLS6np3Bdm41GRRTESI40OGC6CeuCRLGJBp6d8qoYUaKA>
 <xmx:YvDsYgb8l1gGjAsqYR9P6L5UUzpk8FK5hIT3JxRMrliUs9YFRCSdzA>
 <xmx:Y_DsYrJv3GYyByS1xUTw6aJDh_0bcfcgc5g7SCunuwzqWPlm8mhn1w>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Aug 2022 06:26:41 -0400 (EDT)
Date: Fri, 5 Aug 2022 19:26:38 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: Request for setup of new repositories
Message-ID: <YuzwXjaXXtufCTvo@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>
References: <YmtNgqfFREYKZM6t@workstation> <YnO4A43EUdnG0b7n@workstation>
 <14235475-bd6b-4b86-61f4-8c2aa7f95838@perex.cz>
 <b6e986d0-b594-4543-ae63-e08e88ad3418@www.fastmail.com>
 <YozAmQFZ3LhqQoZN@workstation>
 <afd7c233-39c5-b73f-75c7-728a8abbd434@perex.cz>
 <Yo2JcNT9rQ0xw0+Q@workstation>
 <ef0ab4a6-ed6e-51e5-ffd8-397aa3e289ab@perex.cz>
 <Yo95YGyUSSBOipM2@workstation>
 <edd3a849-13eb-9a21-963e-f8cc8deffe47@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edd3a849-13eb-9a21-963e-f8cc8deffe47@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>
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

Hi Jaroslav,

I apologize to be late for reply to the message, but I'm under heavy load
to publish Rust crates recent few months.

On Thu, May 26, 2022 at 03:35:40PM +0200, Jaroslav Kysela wrote:
> On 26. 05. 22 14:58, Takashi Sakamoto wrote:
> > Later I'd like to use Jekyll backend of github pages[1]. Would I ask you
> > to grant my privilege in the repository so that I can add configuration
> > for it? I think the same privilege set in libhinawa-docs is enough.
> 
> It seems that it's just a configuration file which is stored in the
> repository, so the standard github pages setup should be sufficient.
 
Indeed. I can publish github pages with Jekyll backend with the concise way
just to put `_config.yml` and markdown files without such privilege.

> Anyway, I made you as maintainer of this gobject-introspection-docs repo, so
> you should do more changes in it, if you like.
 
Thanks for your arrangement, however I can see my privilege in repository
settings just for archived alsa-gobject-docs...

 * https://github.com/alsa-project/alsa-gobject-docs/

Anyway I'm not so eager to have the privilege now since it's enough at
present.


By the way, now I published 30 Rust library crates in crates.io,
enumerated in this page:

 * https://alsa-project.github.io/gobject-introspection-docs/crates.html

Currently I'm an owner of the crates, while I'd like to prepare the
possibility to grant ownership to the other developers for future
accident. Then I'm investigating to use "team" owner feature of crates.io
service.

For the feature, the service of crates.io needs to query team membership
in github.com, but the service should be permitted it by github service.

 * https://doc.rust-lang.org/cargo/reference/publishing.html#github-permissions

According to the above document, the way to grant the permission seems
to be either to remove crates.io from the blacklist or add crates.io to
the whitelist of organization's third-party access page.

If you, organization manager, don't mind OAuth access from crates.io, I'd
like to request it via my github account. I guess that alsa-project
organization currently has no effective configuration to third-party
application access policy. When I requested it, you can see something
new in the page of policy, then I'd like you to grand the access. When
granted, I will operate settings for the crates to add team owner.


Thanks

Takashi Sakamoto
