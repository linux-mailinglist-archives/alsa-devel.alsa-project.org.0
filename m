Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E67958A9D6
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Aug 2022 13:00:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05C121630;
	Fri,  5 Aug 2022 12:59:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05C121630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659697214;
	bh=LssB9q3XMKoQ7EQVGAPiqx6YyVoJ1gOAG2EdUpuUblc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kuvAfAKcu9S3E1/2zN4C1QeRpyfITd16naD+Gy0VJvjNnSe1zT5Qci/XB1Lfb63cB
	 otI2IFn1qja7Uoq5Cyi4AFxYm1j04OJzkHGBogrCQOZix1T9+mCJClOk4QykILiYoZ
	 7Oa7lw8TjvA0Yt9yVRFwPILn240Kvv8GA02YdhQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ADCDF8012F;
	Fri,  5 Aug 2022 12:59:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0EE3F8025A; Fri,  5 Aug 2022 12:59:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B79CF8012F
 for <alsa-devel@alsa-project.org>; Fri,  5 Aug 2022 12:59:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B79CF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Ib4Ih7Fs"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="MtgfGA2y"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C92EC5C0175;
 Fri,  5 Aug 2022 06:59:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 05 Aug 2022 06:59:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1659697140; x=1659783540; bh=J9
 jqBL02tSkO0UyBxOMMW/ul/aSlaa4FpaM0KMvv7Wk=; b=Ib4Ih7FsTNSWuIQOUb
 NDk3bCJkYf4SIktyRZVWRwTPmn7RXCYUlCGvKFDVDjuXWViGD9o9UabtwSHNir/Q
 Uyy78iUzSQYhpMkc3KHTqGKBlfkKTK3HvqjL57fSYzORpWE6tNxLeaV3BZVx2LUJ
 nSXRLyfI9WzRVzvsuDeOzRwO3KKgx9KOox80BiLJG8EKxm8oNwE+d4q2r2trbfbf
 5uKSO7Rv611t0q9HD3P5AgKzlLiKsq7Z+mHKHe9RmuBaolJC5hhZat+JSBf5ONaJ
 qNZDnIC2qZE71aZhZVbsdW4li1Qx0/cSbnA0T5e0DjzktO3yIL9w9a57IbpAxns9
 R3TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1659697140; x=1659783540; bh=J9jqBL02tSkO0UyBxOMMW/ul/aSl
 aa4FpaM0KMvv7Wk=; b=MtgfGA2ykRRQA/ic6Em9KkvQU+GCH73Y4y+n6NLMZB85
 Q0iDElVDOX0qCCFLpx2Mas/3q9l6wkeK/AYzs1eIicnVMdUrQZogJ6B6VtqW2U2L
 zKhNLklawb51/oaLgoVwtRfRwxcsbzGXv2r4eMY7ifeOiQ74g/IFg9J2rPvqwanP
 xotozlVWXUOJwIBcJpAJE8xvV6ATcepJ7zDVqg+6eJrYdR9rEEgZMXPEyao1fOFe
 aoNftb3BVYBy8iO16XFhLPLDYXJn03KRlSNGYi5l84oBHTo/L2I2X5mgoyUZg8/X
 dFlSjvlEfSBFU46BSpOZqYuizGw3Heq9+jRvnvc6lg==
X-ME-Sender: <xms:9PfsYpKwCbV_XN7DF2vNQgUr_AIIuZDNk7Lvl91r53wPjw3OLT5GbQ>
 <xme:9PfsYlJ2UXQvbP_80hV-KgL7nypZ_XHPcP47VyJorONo278ZouFwHFMmNQpBdqm5S
 t0TD3TwkNjPp7gqjas>
X-ME-Received: <xmr:9PfsYhtl9d2JYigJ2YupK8noFt74Oj7SlfvG96cXpRzscFooYjdmlBCXyzA5-9rxKi5ycZWEaxHpdZ8SdKkfXEgHBXRtrxL4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefuddgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 goufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepfffhvfevuffkfhggtggu
 jgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceooh
 dqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhep
 veeihfettefhfedtheeuvddvudekjeeflefhudekjeefjeehhfefveeihefhhfevnecuff
 homhgrihhnpehgihhthhhusgdrtghomhdpghhithhhuhgsrdhiohdprhhushhtqdhlrghn
 ghdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:9PfsYqa6Gd5RYrWd_ZNmVnXvJIRd9Sx_o6grC-yQOizqYSdLDNcOig>
 <xmx:9PfsYgZh8e_8j6OdR3q-afgcDQ8ViS9NOHOfC-4SNTmuwRosH4_Udw>
 <xmx:9PfsYuBPYC1MtNYFPiJAH4PLtuCm1olPpcfNFEU38nDA7MH-8GoyEg>
 <xmx:9PfsYrw0k8uwKtezdPlG-_wLsLQa_2T0kBLKF2gXCKu_i5i1M8mu0g>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Aug 2022 06:58:59 -0400 (EDT)
Date: Fri, 5 Aug 2022 19:58:56 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: Request for setup of new repositories
Message-ID: <Yuz38K05IOxVXcnK@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>
References: <14235475-bd6b-4b86-61f4-8c2aa7f95838@perex.cz>
 <b6e986d0-b594-4543-ae63-e08e88ad3418@www.fastmail.com>
 <YozAmQFZ3LhqQoZN@workstation>
 <afd7c233-39c5-b73f-75c7-728a8abbd434@perex.cz>
 <Yo2JcNT9rQ0xw0+Q@workstation>
 <ef0ab4a6-ed6e-51e5-ffd8-397aa3e289ab@perex.cz>
 <Yo95YGyUSSBOipM2@workstation>
 <edd3a849-13eb-9a21-963e-f8cc8deffe47@perex.cz>
 <YuzwXjaXXtufCTvo@workstation>
 <e8d9c980-11ce-d0cf-6df4-5a6a7ee8b1f9@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8d9c980-11ce-d0cf-6df4-5a6a7ee8b1f9@perex.cz>
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

On Fri, Aug 05, 2022 at 12:42:59PM +0200, Jaroslav Kysela wrote:
> On 05. 08. 22 12:26, Takashi Sakamoto wrote:
> > Hi Jaroslav,
> > 
> > I apologize to be late for reply to the message, but I'm under heavy load
> > to publish Rust crates recent few months.
> > 
> > On Thu, May 26, 2022 at 03:35:40PM +0200, Jaroslav Kysela wrote:
> > > On 26. 05. 22 14:58, Takashi Sakamoto wrote:
> > > > Later I'd like to use Jekyll backend of github pages[1]. Would I ask you
> > > > to grant my privilege in the repository so that I can add configuration
> > > > for it? I think the same privilege set in libhinawa-docs is enough.
> > > 
> > > It seems that it's just a configuration file which is stored in the
> > > repository, so the standard github pages setup should be sufficient.
> > Indeed. I can publish github pages with Jekyll backend with the concise way
> > just to put `_config.yml` and markdown files without such privilege.
> > 
> > > Anyway, I made you as maintainer of this gobject-introspection-docs repo, so
> > > you should do more changes in it, if you like.
> > Thanks for your arrangement, however I can see my privilege in repository
> > settings just for archived alsa-gobject-docs...
> > 
> >   * https://github.com/alsa-project/alsa-gobject-docs/
> > 
> > Anyway I'm not so eager to have the privilege now since it's enough at
> > present.
> > 
> > 
> > By the way, now I published 30 Rust library crates in crates.io,
> > enumerated in this page:
> > 
> >   * https://alsa-project.github.io/gobject-introspection-docs/crates.html
> > 
> > Currently I'm an owner of the crates, while I'd like to prepare the
> > possibility to grant ownership to the other developers for future
> > accident. Then I'm investigating to use "team" owner feature of crates.io
> > service.
> > 
> > For the feature, the service of crates.io needs to query team membership
> > in github.com, but the service should be permitted it by github service.
> > 
> >   * https://doc.rust-lang.org/cargo/reference/publishing.html#github-permissions
> > 
> > According to the above document, the way to grant the permission seems
> > to be either to remove crates.io from the blacklist or add crates.io to
> > the whitelist of organization's third-party access page.
> > 
> > If you, organization manager, don't mind OAuth access from crates.io, I'd
> > like to request it via my github account. I guess that alsa-project
> > organization currently has no effective configuration to third-party
> > application access policy. When I requested it, you can see something
> > new in the page of policy, then I'd like you to grand the access. When
> > granted, I will operate settings for the crates to add team owner.
> 
> It seems that 'maintainer' priviledges are not enough - changed to 'admin'
> for your account in the gobject-introspection-docs repo.

Thanks for your kindness. I can now see settings page itself and many
items in it.

> I have no objections for the OAuth access from crates.io .

Ok. Just now I sent the request to organization. I'm waiting for the
acceptance notification.


Thanks

Takashi Sakamoto
