Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B041A381522
	for <lists+alsa-devel@lfdr.de>; Sat, 15 May 2021 04:21:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30150172D;
	Sat, 15 May 2021 04:20:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30150172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621045267;
	bh=u1JXOyzI83RkW4wh/WVv+mOty9+5FJTKtq/BkzpKw6M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ext+Lt0DXHiXrBmalXs4cO3VCEWH/dLNFKhHaOxVV/vZg0uofnxPDSC3aBIqRoHd8
	 ErRavVsqSNUpmWbd/OnE95gP581LZBZiNt+bI2w06UXDBXEE6gsGG2kUPVghCxX93B
	 4XCvcsxNDjocR6isKEGZwTbHOjvT7sAg/nqKUMtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6191F8016B;
	Sat, 15 May 2021 04:19:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BFDDF80163; Sat, 15 May 2021 04:19:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15559F8013A
 for <alsa-devel@alsa-project.org>; Sat, 15 May 2021 04:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15559F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="pNThhLql"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="czvOhI1t"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 634C81BD3;
 Fri, 14 May 2021 22:19:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 14 May 2021 22:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=AvBAJFX+d4hfuVND6j2upWr/c+S
 k8F1wBdvfPFlh4UE=; b=pNThhLqlZlQ4ICOgjyd69tHEdOayVdsIxeYIckuu1sC
 /xabq6oo1wwliTxynhS/SQwq5bLeGV8tkyJecfweaXhV4Yn+13Y25lr1YxLdY5Br
 rUOJvtyFmBnT/8uwFJO5jys3ZWaoykt6QVWmuy/8jLwIudiazVpEiMxSSCri4UKk
 36Ku6ClMkSUb9BpsZyFUgm3dfygTHrd71Bh51kfId4/D/EfnUuX+USTAVokQXtLY
 0eW/w0npborHWb4kBP5TLp6extF6MAeB83NKZ+OLOk7uL9bzXjEtAfO2A549guVQ
 czxA8kicbY1A2E3F0ONmE/oTsC4C4soLc5Ldqp1UTGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AvBAJF
 X+d4hfuVND6j2upWr/c+Sk8F1wBdvfPFlh4UE=; b=czvOhI1t27IuchQV13ovc9
 n4ZRFeyB0nP1m6xi+wbNCpwTqdC4yA8nIlo7HbUkkPzitIyOOafPSgl7VOpR9DZO
 bbpjV3OAvLMRB9IgiWav+MllzrIZRX1ttOge2expMPVVbk0Ib52rmkDxwjoUbA37
 ub9fjLvDavgBywNtpg/Wvvjdqq7GsTG1LT4GA5J+Hcpx7CqLk5ow/sirBKzXj2hk
 qpPdcbse4RCEWDbpoM3KnV+nHcFeykY7gJK3jtdxLvxIhQOgik6Q7jh5J9+/zWMY
 ALVCuyHaEzQbyiasquLhPg3qIkDlyEVmtC8EV2fg8Au0FkzTtYLN7hnnG+XO1rdA
 ==
X-ME-Sender: <xms:py-fYBMFDs9_OVe_i-2tnez4MKlWukwbbFZfb88a7s1BpdNAigSTxg>
 <xme:py-fYD9XATEICgANf99NrTd0_ZBNDFHOhaHk0xyvMyOaTsYbETbXubdmuu_lTKBU8
 Gk9SBxC_-CCxcDPH7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehkedguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttd
 ertddttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeelhfeuge
 dvjefgjefgudekfedutedvtddutdeuieevtddtgeetjeekvdefgeefhfenucfkphepudeg
 rdefrdeihedrudejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:py-fYAQYaRkfzOZG3loFDUMDuWKN4IzLBiL3KD9MH09PRbj4N26SwA>
 <xmx:py-fYNs95h2sMV989-ZVG23AarENZOxLAOo8hFvpe8DFICbAtq30Yw>
 <xmx:py-fYJfcwsLkGHqnXJ0sm8-2W2fYHJxbkxuTMByqYr-7sUBxaAwAAg>
 <xmx:qC-fYJmxV6lZJLHPOJcyTDFK7wx6LcZ5dAG-eyX4UN7KGeDJ2wUvtg>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 14 May 2021 22:19:18 -0400 (EDT)
Date: Sat, 15 May 2021 11:19:15 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: Re: [PATCH 0/7] ALSA: oxfw: code refactoring for quirks specific to
 ASICs
Message-ID: <20210515021915.GA27439@workstation>
Mail-Followup-To: tiwai@suse.de, alsa-devel@alsa-project.org,
 clemens@ladisch.de
References: <20210514085435.92807-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514085435.92807-1-o-takashi@sakamocchi.jp>
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

On Fri, May 14, 2021 at 05:54:28PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> This patchset is for code refactoring to ALSA OXFW driver, mainly
> regarding to ASIC types and quirks.
> 
> 
> Takashi Sakamoto (7):
>   ALSA: oxfw: code refactoring for existent device entry with
>     specifier_id and version
>   ALSA: oxfw: add device entry for Loud Technologies Tapco Link.FireWire
>     4x6
>   ALSA: oxfw: add explicit device entry for Loud Technologies Mackie
>     Onyx Sattelite
>   ALSA: oxfw: add comment for the type of ASICs
>   ALSA: oxfw: code refactoring for jumbo-payload quirk in OXFW970
>   ALSA: firewire-lib: code refactoring for jumbo payload quirk
>   ALSA: oxfw; code refactoring for wrong_dbs quirk
> 
>  sound/firewire/amdtp-stream.c     |   7 +-
>  sound/firewire/oxfw/oxfw-stream.c |  20 ++---
>  sound/firewire/oxfw/oxfw.c        | 123 +++++++++++++-----------------
>  sound/firewire/oxfw/oxfw.h        |  10 ++-
>  4 files changed, 76 insertions(+), 84 deletions(-)

I readlized that the 2nd and 3rd patch include bug that the target
device is not identified. I'll post take 2 patchset later and please
abandon issued patchset.


Regards

Takashi Sakamoto
