Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB76213DBC
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 18:51:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 424BD16CB;
	Fri,  3 Jul 2020 18:50:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 424BD16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593795090;
	bh=VaZuqzSVOQo1CFbSJdv1voPfjGj4y5CKxBvZQ/BpF0Q=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CtOB99OJKO9422ItEQ7ahxRh1rj1vtGf8x6bhugloHN9kwoGpGKti70UD9yWkASIV
	 rY5+5GHRvxwx4+N/wxcIpnG85alIhVd6c2j0SGZJv228RIYjy1gSNm/3ynNaO6C9iK
	 i00oeHR64UpUUOtgMZXDChn5fap6+n/KXQKtQXWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 685DBF800E0;
	Fri,  3 Jul 2020 18:49:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76EC1F80217; Fri,  3 Jul 2020 18:49:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, PRX_BODY_135, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBF52F800E0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 18:49:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBF52F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="UJvkgiIy"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Cs+uaj9m"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id CD5205C0134;
 Fri,  3 Jul 2020 12:49:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 03 Jul 2020 12:49:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=fm2; bh=VaZuqzSVOQo1CFbSJdv1voPfjGj4y5CKxBvZQ/BpF0Q=; b=UJvkg
 iIyurbC0S7w2IB+0C0oI3hF6vv2c/55n6aXsmMsMqwJO4UfUH1nrsDy0g3wmYWC+
 j0A/bzp2zGIZngSX1CCz5GFKAWRpQyStR6VAo8XEkjIthUx7I3aNBej6tNgsSVws
 uEGrrTn91bzExR15c8s7SYwixnXfo46BqJjOAsBL1TBuClyDtPccsZMePrx8gL76
 2fqEKa5wKDe6D1PlMrc5izeDDpzlT9x19w9XD/u3EJI3c3Nj2oSiHwn9RWI8Tty6
 Vj6xyqxStozN0Av/EPvlirjFASvK0X3xovvkSYl0+/iluvGvQ5GP+paAb/3F5nDa
 inNO7/CCwZtF/7R0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=VaZuqzSVOQo1CFbSJdv1voPfjGj4y
 5CKxBvZQ/BpF0Q=; b=Cs+uaj9mAlNsY7MSR6StVEEljUOfv50mf6gQ4oklKShj2
 xi51xk10uQt+79ICZCydZDYa02Dhi2Xak4b1/hSVfvWYVQxHO2+rArRqS/O5ob/x
 Biu7O0KNBI75RC6rdqS8Q/xlsLbhzLKbgUkwUmqMAoHxOyJzKAZwQiDJR5bc55FN
 nwTc5B4zT9AW+p7P7G2OcmGXcu0lJJ89ojSqy+dr6myTlu7UiXoyKt0JBhOUK5/P
 iM8XeaKWmsCm5nsWhtINCnveJZ66QLPr6/A6/W8WWDVrwmk6ZgxXWS47SrVXk6KM
 SXcvnqaekkb+AXu0ydesAl780jAg7HmKGXO5obhzg==
X-ME-Sender: <xms:oWH_XsGljkHs1CFYQv_4xprnxHtnIV2pgVz03VW7qm6vjAuqF0a7ig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdeigddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesthdtredttd
 dtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepuedutefhleejle
 egudeklefgkeelgeeuffeuueeuffdttddtgfetuefgheegfeeinecuffhomhgrihhnpegr
 lhhsrgdqphhrohhjvggtthdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedukedtrd
 dvfeehrdefrdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:oWH_XlUViobQRHMYHkHeUKWrnq2wBDlNMT2QHXszraWbb0TpbyPc3g>
 <xmx:oWH_XmLLsa_CpYz1Wbws5CXLzqDHlxPwdwctIwsCcmH6UOcQJZ6O5Q>
 <xmx:oWH_XuEQqUrpCpOatsf5vOR6NTTltz6rAuAu_4y6G_7LPqxWMWogkA>
 <xmx:oWH_Xqini2yHrzXKIdkUS_D8GOzwdXzgzf4RSftci-LNytVVK0lX3A>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 797503060062;
 Fri,  3 Jul 2020 12:49:36 -0400 (EDT)
Date: Sat, 4 Jul 2020 01:49:34 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: perex@perex.cz
Subject: Move ownership of snd-firewire-ctl-services repository
Message-ID: <20200703164934.GA49779@workstation>
Mail-Followup-To: perex@perex.cz, alsa-devel@alsa-project.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

I'm currently working for the idea of 'ALSA control service in
userspace'[1] for audio and music units on IEEE 1394 bus under my personal
repository[2], and the work mostly done for Digidesign Digi 002/003 family
and Tascam FireWire series[3].

As well as libhinawa and alsa-gobject repositories[4], I'd like to move
ownership of the repository to 'GObject Introspection' team of alsa-project
account, then continue the work. I'd like you to arrange access rights and
so on, again.

Besides, as I tols you in previous message[5], the nested team is not
good in reasons. I strongly request you to leave 'GObject Introspection' team
and drop 'Hinawa' team, again. Would I expect your arrangement for it?

[1] https://mailman.alsa-project.org/pipermail/alsa-devel/2020-June/169141.html
[2] https://github.com/takaswie/snd-firewire-ctl-services/
[3] https://github.com/takaswie/snd-firewire-ctl-services/tree/topic/services-for-dg00x-tascam
[4] https://mailman.alsa-project.org/pipermail/alsa-devel/2020-June/169141.html
[5] https://mailman.alsa-project.org/pipermail/alsa-devel/2020-June/169191.html


Thanks

Takashi Sakamoto
