Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1523041CCA5
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 21:31:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6703D16E9;
	Wed, 29 Sep 2021 21:30:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6703D16E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632943903;
	bh=TtOOKpJcz6q+UuM03Z4AJhfNS9P4VdZp3o/oxzRnQ7s=;
	h=In-Reply-To:References:Date:From:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mKRwVyF2H1UClhKOe4Q3GWYp1JI8Xkycu/+4iBtD0CH4bIMInAWuoOcd7N7kCyFOs
	 6fPtlMAsfJpHogsSTxB5Dxgw/fXlIP9zqe4qSgyt2yUIHgsj/Lkyfg+/+QiwG0nxaN
	 3yBPTH9BNnYSxxC8JjpHl18xmKXLayg3Rruy4ag4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0AF1F80105;
	Wed, 29 Sep 2021 21:30:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB087F80227; Wed, 29 Sep 2021 21:30:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D4CEF80113
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 21:30:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D4CEF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=noisetron.com header.i=@noisetron.com
 header.b="ZG7nDN9E"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="vcu5hzy6"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5AAC85C013E
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 15:30:17 -0400 (EDT)
Received: from imap45 ([10.202.2.95])
 by compute3.internal (MEProxy); Wed, 29 Sep 2021 15:30:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noisetron.com;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=TtOOKpJcz6q+UuM03Z4AJhfNS9P4VdZ
 p3o/oxzRnQ7s=; b=ZG7nDN9EyeBZCw5odbPixHw4HEWOYhIHsSI6WrY9iuBImVq
 7MnQFU0THzeLuN41qwaFKOCmaKgrBqkV3iasBEEby9F8Dbg1Vl7tWq+tSz/e+lXz
 6dXFSEe+3YmHZ2svEPi6cwAlp3SFrJZPgEhCxOsvW4mjQEMjUB+zBrq3uPKji1Ay
 IndkSIfeshxhnSSjfaWJNjPcm6WpWg7fdfF+Tq9IcRxDnUUFQZL+eqjpL8Xvsw9f
 IOvHdrEIlkJSB7y5Ar2/NtjouDrAsttrFXSh49934EZdPeR7X/TjNr7IMp3NjCdD
 cEZnQsZEyiBbf8s/HF7NtVDeaM6Ndr2CXQnLSTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=TtOOKp
 Jcz6q+UuM03Z4AJhfNS9P4VdZp3o/oxzRnQ7s=; b=vcu5hzy6ilbeZGDXk6uaEG
 ibXHdJz5xWZcJeLpCbXGlaYBAUCGr61JajlIQ7+ARHdWEWU7rnxehHn2550FuOcw
 1BbnMikhDtVrEt5ulBPe4p6ncqzIoLH/FIqT29DRWwgp0gLyiOxutau5InqcTOns
 4TC+Ka9wIt97l0thls3Gv7DrK/PscIKS3T3LaEovvkkuq3nwWQPBhyEgwpqcJpsV
 pIkUmoXPt/GfwBmUwI10NXGFCN6k4JjDbA9fEM6vZCZbAb6gMlg2PMhrS6WHFGNz
 Gs5M+55oyz6AjtbUEbjsDNPBQwVkVacLYbR6spKDoibEWlZKrrlFggdx8waoifqA
 ==
X-ME-Sender: <xms:yb5UYWlRw7oB4k1pDl21p2olDMFQbHVmwOMPM5V7HVLzUSlOTnWamw>
 <xme:yb5UYd0bEGNymlqAVpSLq_B0wOVxG-EF05o4UECy3pHoeg5inWPaekoKyEKxmLIJ2
 dDTX8-fnHWgskmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekvddgudefhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesth
 dtredtreertdenucfhrhhomhepfdeuvghrthcuufgthhhivghtthgvtggrthhtvgdfuceo
 sggvrhhtsehnohhishgvthhrohhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefteffhe
 dtueevjeelveffueeugffghfegieegkefhteeluefgudeljeefhfelkeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsvghrthesnhhoihhsvg
 htrhhonhdrtghomh
X-ME-Proxy: <xmx:yb5UYUrDAPS0oB4V2VBPyMbvuOOU8r7oVcYLzqUtgzZvTA9qqm3p4w>
 <xmx:yb5UYakO4wyjaOMRgl1rngmTToXlA_oFsOFZ3ilnmXiGen3aD2wiEw>
 <xmx:yb5UYU3Y6MmbYQnLWQPN9prvdR9C0NTLGzXuFG2bJzsFMCqQPSVDjw>
 <xmx:yb5UYVAgO-owBplFS67jXTB9tEXuMOsgvmX3D6BJ3HMsHLP4T-OEyg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2EA7024A006F; Wed, 29 Sep 2021 15:30:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1303-gb2406efd75-fm-20210922.002-gb2406efd
Mime-Version: 1.0
Message-Id: <effffcec-7bab-4225-8bc4-a110f4c3f878@www.fastmail.com>
In-Reply-To: <YVS+AsiTRt1FqMn0@geday>
References: <YVS+AsiTRt1FqMn0@geday>
Date: Wed, 29 Sep 2021 12:29:54 -0700
From: "Bert Schiettecatte" <bert@noisetron.com>
To: alsa-devel@alsa-project.org
Subject: Re: Behringer UFX1604 and UFX1204 unneeded implicit feedback
Content-Type: text/plain
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

implicit feedback is required for other platforms as well, for example mac osx

On Wed, Sep 29, 2021, at 12:26 PM, Geraldo Nascimento wrote:
> Hello Takashi and everyone,
>
> Behringer UFX1204 and UFX1604 have sync endpoints and we set up
> implicit feedback sync on them. This is against the UAC spec.
> We've already fixed a major source of noise by explictly setting up
> the Clock Selector. Therefore in my humble opinion we should now
> disable implicit feedback sync for those two devices.
>
> What do you think?
>
> Thank you,
> Geraldo Nascimento
