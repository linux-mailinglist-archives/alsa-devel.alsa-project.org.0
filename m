Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 964AD50FC14
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 13:40:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 230E6169A;
	Tue, 26 Apr 2022 13:39:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 230E6169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650973206;
	bh=1wRc5+WxPtpD5L7hxpINCWqT213DKvWEt1NQszCNluM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WNAlRbCK0iYuvh1K8sERpG7ePWAcfXr5is4PlyxX5pfRe+O5SgJvR6lm2dVI0QYOg
	 T114rZiK8FHw6kAp07mnv6ymbsaa+Q2mc6NEZPni5rnn5EIFCnAQubHWku+J13Aigf
	 C8jeEFaoLg4ma3+AKZT/ssP57bdeXhnHLsiBW00s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 805C8F800FA;
	Tue, 26 Apr 2022 13:39:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 745C3F80152; Tue, 26 Apr 2022 13:39:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 532F0F800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 13:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 532F0F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="EJH4AH38"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="olr402C6"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id DE2C35C00BD;
 Tue, 26 Apr 2022 07:38:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 26 Apr 2022 07:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1650973130; x=1651059530; bh=tp
 SKrAMz1HfJGvnDwlC/N803N8U4MmJ4Bpysxay/84Q=; b=EJH4AH38qCDTUYV7Bc
 xY/uk+60HB2YXSwvvP6fmbLXciRsXrNSv29ERFqq+4KRXG2sSCJIp34WGNSyS8l8
 t44qmtYHixHu7PPL4RuZ8BWgBcIjN9w6Wsw4F072v4xyTBoMzlQ/+pWRRqPS0uw8
 0HcnoMP7fMkQBbm4N+4glG8jTFG2dWEZqBuQXLHxSZYeRm/NVwhGyGXG8XxyjRbs
 NmlZSg1XmMjCWN15L4Si+fK7AW4+7Zvh7ZDTVMe5FQsciV0FBFHGGnQf7gsEPvdJ
 H9stm4gDBhrf3QjoUFsc5thzz/pJppYBLT3j6QTwcDCzUAYN4I+cWk9DN1TqvwzG
 9Ybw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650973130; x=
 1651059530; bh=tpSKrAMz1HfJGvnDwlC/N803N8U4MmJ4Bpysxay/84Q=; b=o
 lr402C67kQ7LzROdUaBk2f5kKpHeMFLrNwW8RgwOW3CFRuCq0mOwsmFjIkcssRRI
 co4Xehdea2JvWN7ryVgAiowoZFbp12kbklhV55hZtAttbZXyzKaFpVLEib9gXSoP
 CREuLwTw2GLM2r/nZnRhKyytGXUMmIMpjuTdaZQgvNAw77hOUK+EVNoyMQxzDQpy
 FcSx/7BsyWWWqQz5FZFfnTiyuf8Fx1un6PgcQgEU9MkNjo9Ekj0Rl4QtIhix4Oi2
 85VJSynwHSfvOcCKuoYvRi8NX53A5qRpEsyeHl/4eHT1BVyfNqlKihHF1qaLdfmp
 3+pYBpcq1k9gOZMDEP1Dw==
X-ME-Sender: <xms:ytlnYvk2GxT-p8ZAm4SWYaFiGkf4mXr1i0lZM7N8QmwReHuI-m77PA>
 <xme:ytlnYi06fOaKWpg4-R1Ugs-wsWz8UJHWdnj2gplEog-L38r80-iFSakvKZ3F_7LKi
 j0PPwTEkiFY5jsBp68>
X-ME-Received: <xmr:ytlnYlqLBV5awAJvfgQgpXtaYVB_mSBy20jUvIGraJ7Ke5zDocR6VmN0sv4_TeyYCrnhOGXwXwxurKbihPWwPk7hsgG4O9Q_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpedujeeiiedtveekgeehveevvefgkeetteduffdukedv
 ledvudehudeujedvkeeugfenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhgihhthh
 husgdrihhonecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:ytlnYnmdassrpJl5wc3Fc4b3KSPnfqfm3G9waBBHQSgfe8etiPINCw>
 <xmx:ytlnYt2Gr7sz09eq0ko5Vt3m5vnOJwX61vPDXwjLFGc1VCLudzziUw>
 <xmx:ytlnYmuWiRcT9YGCmvXX6eZaTAuDayShSp9LPsMHVQJF0HV_le_zvg>
 <xmx:ytlnYu9-YHV1eiQ50StAUvlP2lOtJZdWGP7zLGNGY2RRTP2RoE35uw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Apr 2022 07:38:49 -0400 (EDT)
Date: Tue, 26 Apr 2022 20:38:46 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: Request for setup of new repositories
Message-ID: <YmfZxmfv5dfgdYG1@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>, tiwai@suse.de,
 alsa-devel@alsa-project.org
References: <YmagC3V3t0k84k9A@workstation>
 <7d90c47a-ce1a-d9d7-ba8a-e794f20487cb@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d90c47a-ce1a-d9d7-ba8a-e794f20487cb@perex.cz>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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

On Tue, Apr 26, 2022 at 09:23:38AM +0200, Jaroslav Kysela wrote:
> On 25. 04. 22 15:20, Takashi Sakamoto wrote:
> > Hi Jaroslav, Iwai-san,
> > 
> > Thanks for your maintenance for alsa-project organization in github.com.
> > Currently I'd like to add new three repositories under the organization
> > as a part of my work for ALSA firewire stack.
> > 
> > I've been maintaining libhinawa since 2014 and recently realized that
> > current design is not necessarily convenient since it includes two
> > functions; operation to Linux FireWire cdev, and operation of ALSA HwDep
> > cdev. Currently I'm working for new library to split the latter operation.
> > Then I'd like you to setup below repositories:
> > 
> >   * 'libhitaki'
> >   * 'libhitaki-doc'
> >   * 'hitaki-rs'
> > 
> > The library itself and its Rust binding are utilized by
> > 'snd-firewire-ctl-services'[2], thus it's preferable to register them under
> > 'GObject Introspection' Team.
> > 
> > Thanks for your assist for my work.
> 
> Hi Takashi,
> 
> All is set on github. Let me know, if you need other changes.

Thanks for your arrangement. At present, I have no with for additional
changes.

However for settings of libhinwa repository, I'd like you to change URL
of documentation. We can see it in right side of top page.

 * https://github.com/alsa-project/libhinawa

Currently it points to 'https://takaswie.github.io/libhinawa-docs/'
while it should be 'https://alsa-project.github.io/libhinawa-docs/'.


Regards

Takashi Sakamoto
