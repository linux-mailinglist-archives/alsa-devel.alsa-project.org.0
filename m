Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8291423E702
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 07:20:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DE251607;
	Fri,  7 Aug 2020 07:20:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DE251607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596777652;
	bh=FwyK/3mmrQDz8dFH9XspZFB5f8sJKDlPcvEFyfsQQiU=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G6voLjIjT3eP8Cz8EOz3KC0nBztf4DwzRV5pmmUUA2T43kkCS8nJw8BK+JwFKH+NF
	 +13ECNtV0k7cU0hpwe+hPHozuJOGTTnWBOvwX7/lhv403/9G842QcFRrdZAkCtsNR9
	 dupx19PxMdth//cmg9RET5CsQGAs0QZ8MufbJGpI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F265EF801F7;
	Fri,  7 Aug 2020 07:19:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02363F80218; Fri,  7 Aug 2020 07:19:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 459DFF801F7
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 07:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 459DFF801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="IjODR5Qi"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="WjyI+lfO"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 0E6D0F49;
 Fri,  7 Aug 2020 01:18:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 07 Aug 2020 01:18:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=fm2; bh=FwyK/3mmrQDz8dFH9XspZFB5f8sJKDlPcvEFyfsQQiU=; b=IjODR
 5QiwlfVdQBF5INshDXPrcVqWuNdECoE3+eDABk7jU2PN65MTGCiElPm76DOS4S7Q
 vdjruBOafDpipEGlV5EtGPtXniMk+/j1lsi+HnrTSZ1XQ8K+6zr4xctJqYeRwGDv
 TUMWa39h+GBbMWAlnDWAqLS90F7siTXpy4k8vMyDyN/22CboQhHMr6jknH1KAmL8
 qaWehhKlWKiBcwa/x2SUUlIHsvND7SwMjMvtL7/QBx4F/04pl0E+V4+aONbIp277
 UJdxnJmmoVVRdgBeDUe8GxZIK+nJ3UIWf06E/91dcXgw7DPFnrHVTaGXdGrGSx4V
 Gln3t+0qVegCIzJdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=FwyK/3mmrQDz8dFH9XspZFB5f8sJK
 DlPcvEFyfsQQiU=; b=WjyI+lfO6/FOdvM40dD8HU9hgaNpE503oU/k9fq+xpPE5
 DB8e+Rt2tZHCcPLVHdNACUUvsjYUfQBaw9IHuDdJHlu9U6FtGanHgulZN0T/+0QG
 suO521pYBSWc0gXofEKE6OLNMeFnaPNPdkzk6W6PzMlqPLQxSyi1MDRfxRuPAXD9
 cT9z/xmm97wB1b3AjtENgq3puKFHrpVcLgEB+daXe+0gU353NX2qV7tuWK1s4uRJ
 CTWoiEVxHVi9phgxhSSP6FGu34I+mP94MI87H/J3A1gOXmlKNjI2JApwmx6p5k2g
 TUNalic9rZWqXQ+5dutByF6MGalKMb2Kp1yHWE2WQ==
X-ME-Sender: <xms:QOQsX0x3qa5fOQAfP4G0t5x0a9gIEtViwvQPN7v08YeXV3jWMiqmZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrkedugdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehttdertddttd
 dvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedugeehgfdttedtud
 fhudegveeufefghfegveekieffudekudfggfegtefgffelffenucffohhmrghinhepghhi
 thhhuhgsrdgtohhmnecukfhppedukedtrddvfeehrdefrdehgeenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghk
 rghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:QOQsX4QvXMlf9SKiDt5cjVqGiM6qbY2Fh6msbPbMBvfi3NrMGusKLQ>
 <xmx:QOQsX2UrAcxy_PrJRAsmZV9Fk2u2s6j8Sf3PfEH9mnUUWLNteDJPeQ>
 <xmx:QOQsXyike8XpB3CX4x_6C3Lot0w36SwaRTOOGixN9ekACiuHuEnW5A>
 <xmx:QeQsX99OPYAF2w-P3hLl-HwM6UXp1MOi7z_32JvTqMrTOFqiBtNazA>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id D49FA306005F;
 Fri,  7 Aug 2020 01:18:55 -0400 (EDT)
Date: Fri, 7 Aug 2020 14:18:53 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: request for missing access permission to libhinawa repository
Message-ID: <20200807051853.GA453546@workstation>
Mail-Followup-To: tiwai@suse.de, alsa-devel@alsa-project.org,
	perex@perex.cz
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

Hi Iwai-san,

As Jaroslav is absent so long[1] (summer vacation?), I would like you to
arrange some team/repository settings for libhinawa.

I lost my write permission to libhinawa repository[2] since Jaroslav's
arrangement for github team. You are an owner of 'alsa-project' team in
github.com, and I guess you have enough permission to configure below items:

1. setting enough permission for my account to libhinawa repository
2. add libhinawa repository to 'GObject Introspection' team[2]

Would I request you the above?

[1] https://github.com/orgs/alsa-project/teams/gobject-introspection/discussions/1
[2] https://github.com/alsa-project/libhinawa
[3] https://github.com/orgs/alsa-project/teams/gobject-introspection/repositories


Thanks in advance

Takashi Sakamoto
