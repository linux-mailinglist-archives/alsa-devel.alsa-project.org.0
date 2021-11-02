Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B81544352D
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 19:11:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AF0A1664;
	Tue,  2 Nov 2021 19:11:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AF0A1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635876717;
	bh=BCRskWTz1u7K07aonkE/LR1FpjiMoDwirA0FR6JjWoM=;
	h=In-Reply-To:References:Date:From:To:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D63O7Jnhq7e3bayZXbxjtd6eiRU2TkWTpdy8jivzt1XtsTFVx3M94HWpC2t9jebRc
	 eq+cfG7qvBW57l8NKAwPG1i7xYMkTwaFwPSb0wpBKrUQ+G/rz8bSziBeT+rf1xm8Gl
	 zmjYk7l/NrunfXpS3KLAJw82wHZJe1jo3JLq/ENc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC09CF8025F;
	Tue,  2 Nov 2021 19:10:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0285F8025D; Tue,  2 Nov 2021 19:10:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 002E4F8012E
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 19:10:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 002E4F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="DKnZlQj6"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id AB75A5C01AF;
 Tue,  2 Nov 2021 14:10:27 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
 by compute2.internal (MEProxy); Tue, 02 Nov 2021 14:10:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=81v7tC
 2cNnbu0/2jg8YE5tMxAILR1A7LJNwpXiiro64=; b=DKnZlQj644l5VoCr97PgVc
 pKIjTB5L4QYTlEzgyfqIji238UK4TWXozHkQtxw17e8wbIp5GENgxRMKcYSP+nDv
 EivPKH37/wS8Mdx9Pzun+CVUo7at+dC/s85W3WQfHatB8T828lKPj+muUw8ecRWw
 +c8lfXDSaIOXfwKGcQESnEhl8A90mVjLVSIf5A/UXgsa/OAgWq+j/R6D2bTDKsv0
 HY492nEtcVCm+5p11gBkObSzq2S96AsMV3BTkhyKae9OUvVMtZygibOihfIQ4At+
 lSx7xYdFm7m5gujFPbIXMaknkTQ8edxMLhqjEUTP6efoedtpKgj3JlDX2Lj/9yWQ
 ==
X-ME-Sender: <xms:E3-BYaB02Imf9FbN9d1zFU9QMPk9M2Oxpxn4_KWuO6KNOMyHU7kG4A>
 <xme:E3-BYUiEZ7Ug8VNgRzOF45lop4xnpokCB496Wu_ZTdCrIWKsu_xRKkACOlrdYSQyq
 RQm8JLu3cNvsNSRxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdekfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreertdenucfhrhhomhepfdfvihhmucevrhgrfihfohhrugdfuceothgtrhgrfihfohhr
 ugesshihshhtvghmjeeirdgtohhmqeenucggtffrrghtthgvrhhnpedugeekleettdevue
 efheffteehjeekgfeglefhieevudehhffgveeiuddvieeuueenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehttghrrgiffhhorhgusehshihsth
 gvmhejiedrtghomh
X-ME-Proxy: <xmx:E3-BYdlarJeL7qVbs9n81ZgZUeO1dIaSyj9maesrVO2OsKdC56b3kQ>
 <xmx:E3-BYYwQ8aA2TL8gQF4S4rOddtmC1n6NHAapEQ3HJNYXScB23OpPuQ>
 <xmx:E3-BYfSX1QCUcJSzuDmw9l5mxB2uP6NMPFOFsBN370Er8IhzPzrkFA>
 <xmx:E3-BYQ6aTqqXOBT3wYDeYwwS0RiLzonBAe2G3hIlldKTiMhHX3faxA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 876A3FA0AA6; Tue,  2 Nov 2021 14:10:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <b293f612-75ba-4f3c-973a-e7722590f3ce@www.fastmail.com>
In-Reply-To: <20211102172104.10610-1-tcrawford@system76.com>
References: <20211102172104.10610-1-tcrawford@system76.com>
Date: Tue, 02 Nov 2021 12:10:07 -0600
From: "Tim Crawford" <tcrawford@system76.com>
To: tiwai@suse.com
Subject: Re: [PATCH] ALSA: hda/realtek: Headset fixup for Clevo NH77HJQ
Content-Type: text/plain
Cc: productdev@system76.com, alsa-devel@alsa-project.org
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

> correctly, and a new ALC256_FIXUP_HEADSET_MODE_NO_HP_MIC fixup is

Sorry, that should say ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE.

-- 
Tim Crawford
System76
Kernel Engineer
tcrawford@system76.com
