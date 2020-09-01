Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5382E259D2D
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 19:28:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDEE817B6;
	Tue,  1 Sep 2020 19:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDEE817B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598981285;
	bh=ZdaW82SwB9AqqEXqzLygppwbvhjTc90nYoV9Rpa/D84=;
	h=In-Reply-To:References:Date:From:To:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ti1+fRtTQlRFhzNo0pjtacWm6bwaDVloWj/3GENUBa9rkqBho+FOtc1npGHCyOuLB
	 ZjQ0vvHDowGOd3RO7jokJMtAs4EBhVWHSeIbAbAVs6aWViFNPeb7GzlauQ0k21u4PV
	 jC1qUTwF8WJYPtkgIF47EoVmv3fhqPMw1DNdiHe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ECB5F800BA;
	Tue,  1 Sep 2020 19:26:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 010E1F800BA; Tue,  1 Sep 2020 19:26:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4606F800BA
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 19:26:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4606F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=fraction.io header.i=@fraction.io
 header.b="oWe5ceb7"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="VvWApi+2"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 8CF67763;
 Tue,  1 Sep 2020 13:26:07 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute3.internal (MEProxy); Tue, 01 Sep 2020 13:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fraction.io; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=urwAh98yFS4GvX1mtV+aas1U8pd9j8n
 e6aRau1JoE34=; b=oWe5ceb7kmi54kWF909odvkKgfiK8nFpaC55iIJ7KBjokuP
 n+MYnhCMzZ3JKnMBqnZkeHGWGP31+tv4dbcG7acYUakzebOKQp7eB1YZuwJ1rT47
 vZd33j0V99QTOrX/WtFiEiid44o5lgMTxN1F16iCpUMPMjf0dd5aWgkqkl9yp9Z2
 HTqcfmMn6zFTO1oaHLiu0tFh/3ElhFR7FIY/XR4bn2Z2HXf9YZqR1vTnEF2ue4TA
 kYyIikL31uVhJFsCGyB18C1ws1NWa4Nn+95q5BywQD1dorQlCDyuUM5pwg/fSdgE
 FSpBgdJnOQIVbcI11TS6+F9/axERAWkBaKvD+gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=urwAh9
 8yFS4GvX1mtV+aas1U8pd9j8ne6aRau1JoE34=; b=VvWApi+2b1JP1uo9gUdbbM
 ajzb1dLb2Jnv+2GgizC7roj6bPbbb3QPeK3GizKE5Vd74NS/HcPZzCLYGc6YZ+mm
 ia0iAPZsd66vQDLSO0OooGmy7L5aBDrXBk42jhOYhcRIAjvV3PrWEpJWy/9f7o0m
 HxkkM4VZKwGjFzJn3DRdG4MxztXhVQFwKD5dbz7hhkpxL3scKnUF5DS6YGJhrOJX
 ADbPCJO4xkXta/uW9jwBZfuigCKFIar2CyVCjheBcqNgTP8U5TXJl8tvnGzt0aFm
 u+FYiMEKG40fbw5PIlbX8U/uRM8y9Gmx/MGBHJhCvr0t+bqoA2DIoMk6D/3TLnlw
 ==
X-ME-Sender: <xms:LYROX4ojsH9jW6_SSPxUveM6v7fzUz9ARLTgGWfhSpOQEPp8oyvAuQ>
 <xme:LYROX-o5G1UPwwF9nVKDwv3Tqd28-erhXPDnV2Z9ES48Cqyo9Tf2GyXrPHQDZjD22
 mAASL2Iq_9p9UVLNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefjedguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedfvehh
 rhhishhtihgrnhcuuehunhguhidfuceotghhrhhishhtihgrnhgsuhhnugihsehfrhgrtg
 htihhonhdrihhoqeenucggtffrrghtthgvrhhnpeeuuddtffdvudeljeeihfeiueegledu
 uedvveehieetffehjefgffehffevvdefheenucffohhmrghinhepshhpihhnihgtshdrnh
 gvthenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegt
 hhhrihhsthhirghnsghunhguhiesfhhrrggtthhiohhnrdhioh
X-ME-Proxy: <xmx:LYROX9M8uPnN519MC0f_xueuBbjIpigecqtqaemIq2yEvrPYebO3Eg>
 <xmx:LYROX_7jfitgd_ObYx5Vkwklp0Oe1OtrjXi5b_SiRaXJI-8K1tAXow>
 <xmx:LYROX34LSTThNSgKXrdUh5rPQ6szQ562dYeu9t5v7EgG4UAuaw9dzA>
 <xmx:L4ROX62D2ctYiCZm1ayUxPBDekmRoPF2jXVeBvBeXc9goz9VSc8-7w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 94779C200A5; Tue,  1 Sep 2020 13:26:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-248-gcd102cb-fm-20200901.001-gcd102cb9
Mime-Version: 1.0
Message-Id: <b16e4a3e-800d-40b9-ad88-af8caa65c4a3@www.fastmail.com>
In-Reply-To: <c93c0522-d8b7-e4c4-b11b-80646cfd0432@intel.com>
References: <9bc5b3ac-87a0-4d7c-abfd-2407db90d310@www.fastmail.com>
 <28ee99bc-fe27-9111-893b-1cb000067a7c@intel.com>
 <026aa0fd558b8b91a67a868a25eb84d8749101b7.camel@linux.intel.com>
 <c93c0522-d8b7-e4c4-b11b-80646cfd0432@intel.com>
Date: Tue, 01 Sep 2020 10:25:40 -0700
From: "Christian Bundy" <christianbundy@fraction.io>
To: "Cezary Rojewski" <cezary.rojewski@intel.com>,
 "Liam Girdwood" <liam.r.girdwood@linux.intel.com>
Subject: =?UTF-8?Q?Re:_[bug_report]_'ASoC:_Intel:_haswell:_Power_transition_refac?=
 =?UTF-8?Q?tor'_and_PulseAudio?=
Content-Type: text/plain
Cc: zwisler@google.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 yang.jie@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Thanks for the quick response. This is great. I've tested the patch and confirmed that it works.

On Tue, Sep 1, 2020, at 08:37, Cezary Rojewski wrote:
> On 2020-09-01 5:23 PM, Liam Girdwood wrote:
> > On Tue, 2020-09-01 at 13:33 +0200, Cezary Rojewski wrote:
> 
> ...
> 
> >>
> >> Hello Christian,
> >>
> >> Thank you for report! Issue is a known one to us and has already
> >> been
> >> addressed by:
> >>
> >> 	[PATCH v4 00/13] ASoC: Intel: Catpt - Lynx and Wildcat point
> >> 	https://www.spinics.net/lists/alsa-devel/msg113762.html
> >>
> >> waiting for final dependency to be merged (Andy's resource-API
> >> changes,
> >> as Mark already added the SPI ones) so v5 with review changes can be
> >> provided. Shouldn't be long before this gets merged. As consequence,
> >> /haswell/ ceases to exist.
> >>
> > 
> > Please also don't forget that the new BDW HW register programming flows
> > need to be shared as common code with the SOF BDW driver.
> > 
> > Thanks
> > 
> > Liam
> > 
> 
> I don't believe this is related to Christian's report.
> 
> Anyway, revert-patch for sound/soc/intel/haswell/ solution has been 
> provided so it can be later propagated to v5.8 and v5.9 -stable with 
> matching upstream commit's sha-id.
> 
> Czarek
>
