Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDFC51BE55
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 13:43:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74B1917E7;
	Thu,  5 May 2022 13:42:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74B1917E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651750991;
	bh=RiZKpjGPWU9iX7NnjyWXnBasG7PiNb8ZAPsMwmkwnZ4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nNnKSduZ+k203rMGljqhdG3Fv4bot3ceOYbL8Mq3B9yNkgTjbVFKD+O6FGK0nvtEa
	 CKvW1fyKgbZlt2GnEi7EehFHsshQwhpjI/dTTOns5f+2E8J4Be2oI8z0r7EMclQ3+B
	 fd3sD9Ag6paAYMgHZTEyv4wxZKUONnptlRxQR9RI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8535F800D3;
	Thu,  5 May 2022 13:42:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F9BBF8016B; Thu,  5 May 2022 13:42:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF8EFF800BF
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 13:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF8EFF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Jv80aofK"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ZipRRu4V"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id EA3385C0182;
 Thu,  5 May 2022 07:41:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 05 May 2022 07:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1651750919; x=1651837319; bh=2A
 swU5Sgs5oz+JP0w5KCyFSMGYy20NB6yG6BOzurl2U=; b=Jv80aofKDVNrDVHeh8
 W5fHdAgE3e3GpJ7BgkjGwT52na34fjtua+iHwrbTxJUzfJQ7x30b8DpkPX6xBF9C
 dPlNzmGbshelRR/gi5KKlfcrFGSnEwIu4x9BCruBxkD9qO9msZijFzJyrEntZw7r
 ZighDHKCZUifQE7ojLsPiaNiCq6RtiTLT8JfuVdNh8YjVDHgc7y6OUy/5uxRqLNN
 d/EirGEz/XOT5gT9Q9iLBp0Pqac6XGPjrzjOkMig+vWc4jQwIGFgEk/FSjbC/5FJ
 ulli0gzztB6DZEyy7ms6DcBHe9UoZOE0znieStQsDVPqTcirO2OiwWCnM8X6qle4
 AtDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651750919; x=
 1651837319; bh=2AswU5Sgs5oz+JP0w5KCyFSMGYy20NB6yG6BOzurl2U=; b=Z
 ipRRu4V9LSUKYVFAyN3msJGFHqIgK4GN83ageMmyWV1WKY5cJANKsq7JU2UUuTDF
 WBOr+Xrb+y+sLWMR1ElnM17aQZWI16INU3iUIYPfkRDO9pZFtvrMJhgBKleUAA6x
 G2HuqIk7R7Kxa/c46GoQGE5ReIgyUmPywHvBSOENqb6zkQGmDD5XiEs1KABl6yxl
 xWVax2O5uMtIQW9c6SnubOFcRPzJnYa8gvj3VrllIiujfg7n+UT8SFeXoysCWkOM
 wG85pPU9VuQSsh1pMzb+xi/hvOA6QqDufTWe4SUxbZ62dmxCInhrnQCHoNdYRWMS
 M/gS2OejHKdTeYTCBvcuw==
X-ME-Sender: <xms:B7hzYjC9uK5r0Hs2ht3_Dv3N9UWQTiOeyg9epVf8QQ2kDzRYhTJ0yw>
 <xme:B7hzYpjJ164QrtuQ2qaAdgZ990ELA0vNR5vlgqwVtMH3TidY6msNCh-Py833HbiHq
 EiN-jXRXuNOg-Gyfg8>
X-ME-Received: <xmr:B7hzYum9f_AhreD-joLDbXJe2gkUGSrrdImmZ5FcZUHynsGK1g-Rb0I2-DLZkNNn-5Y5lau_LS_jk71JtNqExXBnOjlMNcQ->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedugdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpedujeeiiedtveekgeehveevvefgkeetteduffdukedv
 ledvudehudeujedvkeeugfenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhgihhthh
 husgdrihhonecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:B7hzYlyespCeDSV_tmmyDmzXQU39cAiEizpd90s7Exm9SYGcD2Whsg>
 <xmx:B7hzYoTZZxe0tVJjMT6Ll51v6IQ4FeOwxLxvc-CAn9xdC_XT0vqgfA>
 <xmx:B7hzYobROsMNWJsVoSW68STZ4yC5n1siiz9_Q_BPh-MDIX5H0iqYog>
 <xmx:B7hzYjKZBLrexwfxwFc3gBm82NkMqqgIQMHkC9T97EhRrrPgOW0tAA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 May 2022 07:41:58 -0400 (EDT)
Date: Thu, 5 May 2022 20:41:55 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>, tiwai@suse.de
Subject: Re: Request for setup of new repositories
Message-ID: <YnO4A43EUdnG0b7n@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>, tiwai@suse.de,
 alsa-devel@alsa-project.org
References: <YmagC3V3t0k84k9A@workstation>
 <7d90c47a-ce1a-d9d7-ba8a-e794f20487cb@perex.cz>
 <YmfZxmfv5dfgdYG1@workstation> <YmtNgqfFREYKZM6t@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmtNgqfFREYKZM6t@workstation>
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

Hi Jaroslav,

On Fri, Apr 29, 2022 at 11:29:22AM +0900, Takashi Sakamoto wrote:
> Hi Jaroslav,
> 
> On Tue, Apr 26, 2022 at 08:38:46PM +0900, Takashi Sakamoto wrote:
> > Hi Jaroslav,
> > 
> > On Tue, Apr 26, 2022 at 09:23:38AM +0200, Jaroslav Kysela wrote:
> > > On 25. 04. 22 15:20, Takashi Sakamoto wrote:
> > > > Hi Jaroslav, Iwai-san,
> > > > 
> > > > Thanks for your maintenance for alsa-project organization in github.com.
> > > > Currently I'd like to add new three repositories under the organization
> > > > as a part of my work for ALSA firewire stack.
> > > > 
> > > > I've been maintaining libhinawa since 2014 and recently realized that
> > > > current design is not necessarily convenient since it includes two
> > > > functions; operation to Linux FireWire cdev, and operation of ALSA HwDep
> > > > cdev. Currently I'm working for new library to split the latter operation.
> > > > Then I'd like you to setup below repositories:
> > > > 
> > > >   * 'libhitaki'
> > > >   * 'libhitaki-doc'
> > > >   * 'hitaki-rs'
> > > > 
> > > > The library itself and its Rust binding are utilized by
> > > > 'snd-firewire-ctl-services'[2], thus it's preferable to register them under
> > > > 'GObject Introspection' Team.
> > > > 
> > > > Thanks for your assist for my work.
> > > 
> > > Hi Takashi,
> > > 
> > > All is set on github. Let me know, if you need other changes.
> > 
> > Thanks for your arrangement. At present, I have no with for additional
> > changes.
> > 
> > However for settings of libhinwa repository, I'd like you to change URL
> > of documentation. We can see it in right side of top page.
> > 
> >  * https://github.com/alsa-project/libhinawa
> > 
> > Currently it points to 'https://takaswie.github.io/libhinawa-docs/'
> > while it should be 'https://alsa-project.github.io/libhinawa-docs/'.
> 
> Additionally today I push documentation for libhitaki into the added
> repository:
> 
>  * https://github.com/alsa-project/libhitaki-doc
>  
> I expect Github Pages makes association between the content and publish
> URI:
> 
>  * https://alsa-project.github.io/libhitaki-doc
> 
> However it doesn't. I think we have missing configuration. Would I ask
> you to change settings following to this instruction?
> 
> https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site

Would I request the above to you, please?


Thanks

Takashi Sakamoto
