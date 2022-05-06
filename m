Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F19C51D3DC
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 10:58:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D894D8;
	Fri,  6 May 2022 10:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D894D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651827488;
	bh=hyVJTklAHqe/9S1DigdKhIPCbcwh6StQg4cMU9x6Qbk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XyKa2aGIOoR4xCUNXajSWJN/cf3UvCbgo2gsYrVbyMAJ5kkLA7kJ8/9Px1V3DU1LL
	 SZq7FeK3/IbAQXyOMBPTCJkFFb04Y7tr1elTjxHvqPNLa6sbdemmEAuzeJfydDmmbk
	 3E1s8rOlgBPvqPBdGLBzEVTOestx3mvt+8tmXh2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB8FCF80171;
	Fri,  6 May 2022 10:57:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AEFDF8014B; Fri,  6 May 2022 10:57:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16396F800F0
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 10:56:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16396F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="DPeE7dXS"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="qJZmW+pF"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 9141E5C0108;
 Fri,  6 May 2022 04:56:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 06 May 2022 04:56:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1651827416; x=1651913816; bh=4A
 yOrRhydfq0OVaMxtVGCJIkc/Ld52zdmZn5K+SoUtE=; b=DPeE7dXSOlySZ46suy
 x64lGvA9qiuNq7jT2B53sm332JkBKlzlvbPzbs26/EyDDQQ8N4JhY2HM0sHafER+
 ggmv7Zt2IrmBX+uih3bGTAJ6xheXR9ZntNscH3lV9VSZ/smgfWVOeZ8hzyXxRq9H
 3URuiGQ+iSkHO2HrVrPng6LINS81kJSVFXlnGSXwa0kBs4aHsuqCcWTAqzyyBXT8
 JnQC/DNTjYTrLzaN7jWQ9IEnfZ23jxE5l7ihYNw/F6b6RZvfjQEPBFpHR5rGHD45
 enIQILZ8/uuMKZ5RrQAAwWw9DR7BxxofheaxYd0U9qhdDrREhFNAXwGaXyMscqWT
 qkFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651827416; x=
 1651913816; bh=4AyOrRhydfq0OVaMxtVGCJIkc/Ld52zdmZn5K+SoUtE=; b=q
 JZmW+pF5nXaozzm/29hA9QIJtfPJSfAJsUmKnoLZ3OcTA9uC4qoVa8tCT/vnlsvL
 OevPydGfIA40ubVjgdRKPJM2A4H9OqqpHh6x6NPBUjWoK86Q6GwjMcVuFYHC6kmF
 0FZWFH9tHqYw2+fsjP+//54hamIIBGkqkwBBCE4glxcBR6kJBFy9sLVtRPO7IRxv
 PS3xKIITQdB2ZG8wE4T7sZffjvTs+zLSCeH/HuuOh/9MueKQPxOefT+GOXfBihwU
 RM22g2WHj6u7cm5wLx/ZAa8nl2ySfysoxJQGySixSL7byiy7hVA0S9lVmOVLpE4l
 Llr6xjQTANGo+++lWxidg==
X-ME-Sender: <xms:2OJ0YvjJETarfqtzrMjQuqoRsOABkCEwC1qDKdcwZBd5zftUtYHbow>
 <xme:2OJ0YsDqnYk7RhKE48xoa-TeP0cQCystyY_jFUbsc1zds8h5NTmnJGApuzn4t-bQe
 eYEHi7pJdLaJZwBqEM>
X-ME-Received: <xmr:2OJ0YvHLhVmY_kRVlkk8SCQK_XrfhswFFHU6zXKP4LF9O_XY8-ooPrFT77ksTaa7xB8m4_pPutELKH-eCrWVLcpilr61qmfe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 fuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvvefukfhfgggtuggj
 sehttdertddttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqd
 htrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpefg
 hfdvjeffuddtheeugeekffdtjeelueefveelkeejjedvhfdvffdtvdefieegfeenucffoh
 hmrghinhepghhithhhuhgsrdhiohenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:2OJ0YsTHQZhQoe7CZ92FC8rcMYXDYWBOUIJx1k2cAqG-zB1apco6hg>
 <xmx:2OJ0Yszqb0o-w3LBH0cuKuE0YpsKKkOMR-BzoePZ3OkS6J5UPz0clQ>
 <xmx:2OJ0Yi7dkBs88UITSmig7iaMiLJKHVqcWkSWh0qCd3YukbGZaob3TQ>
 <xmx:2OJ0YpqHODLLPCdfUva5zNrJvfkyLt5VIDfoKoC2913Ve7xG-gsNVA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 May 2022 04:56:55 -0400 (EDT)
Date: Fri, 6 May 2022 17:56:52 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: Request for setup of new repositories
Message-ID: <YnTi1Hs1KgkhmlEr@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
References: <YmagC3V3t0k84k9A@workstation>
 <7d90c47a-ce1a-d9d7-ba8a-e794f20487cb@perex.cz>
 <YmfZxmfv5dfgdYG1@workstation> <YmtNgqfFREYKZM6t@workstation>
 <YnO4A43EUdnG0b7n@workstation>
 <14235475-bd6b-4b86-61f4-8c2aa7f95838@perex.cz>
 <b6e986d0-b594-4543-ae63-e08e88ad3418@www.fastmail.com>
 <2a0398c4-7d13-39c6-872e-1b802564c231@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a0398c4-7d13-39c6-872e-1b802564c231@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

On Thu, May 05, 2022 at 02:59:06PM +0200, Jaroslav Kysela wrote:
> On 05. 05. 22 14:49, Takashi Sakamoto wrote:
> 
> > Besides, please fix the URL in "about" information of libhinawa repository.
> > You probable see a wheel icon in right side of top page. When clicking it,
> > you can see "website" field has "https://takaswie.github.io/libhinawa-docs/".
> > Please replace it with "https://alsa-project.github.io/libhinawa-docs/".
> 
> Done.
> 
> 				Jaroslav

Thanks!

Takashi Sakamoto
