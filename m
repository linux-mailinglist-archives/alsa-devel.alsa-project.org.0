Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 058DD55A96B
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jun 2022 13:30:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6722C1734;
	Sat, 25 Jun 2022 13:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6722C1734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656156600;
	bh=fv9EZX3Z6khwiWivN3npbr3hcYvxeihWnNw41+qtMc4=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JN1xezDPcPRMUDCCpP/jgXVtpiymlAdQPaevvW/RKBEO4z7fXbqvdPn8VAHxMda8V
	 pdn6P5sjm4pdCUnSnZjjnxxx30YALp/ABiV2u+OrK1k7IFVuN94p6YsiKJ91xZIKnV
	 Y9/2x4rIjANbHYYY/Rp3q4Sjs7s2NmNYbR+Co4sY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFBDFF80107;
	Sat, 25 Jun 2022 13:29:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 393B7F80162; Sat, 25 Jun 2022 13:28:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C76A6F80107
 for <alsa-devel@alsa-project.org>; Sat, 25 Jun 2022 13:28:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C76A6F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="2xtw5IUc"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="DNwCaNTO"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3C80C3200645;
 Sat, 25 Jun 2022 07:28:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 25 Jun 2022 07:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1656156523; x=1656242923; bh=fv9EZX3Z6khwiWivN3npbr3hcYvxeihWnNw
 41+qtMc4=; b=2xtw5IUcbQlGWIrWotJoWX9DseMVsaUWCwAokZRT1XxnxO3Vrff
 d4zyaR+X2VyZDWcPhD62jw75YybQvSy9pWH/0aRYM96SXRLmCaRfBF8NKFrVZ5lP
 jE28QJ0GzGEqghPO6yNDiMvHBdiIKxvR1mdVbLvFi58SVXb0lP3p9sx7jqdxN/H1
 sR3sqzN6AdAOyBWZAvSYyQ5mxhi1AAdYovTECRdEHrjJkbICUDgquEbax5/rFc+P
 PVNVijQBuVih6h4YO9W4n7b8rUdKrDiSB84RBmMuv3ef4nFAH8G4TBj1GfvhE+uc
 q0EZiREfR8KO4c9gJYw6AzW9T2z8qX9QS+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656156523; x=
 1656242923; bh=fv9EZX3Z6khwiWivN3npbr3hcYvxeihWnNw41+qtMc4=; b=D
 NwCaNTOMiosxIn7PVIS/Lb1yypbiyD6ra7yjVwf8MDPx/L4cyHcsk02EQeHhlaxG
 8ZxKmlMp24oYzKfcQLKNyHyqa8H82ALBwm3XPIGBN9IinPnT/odqOX0iEDd5kpve
 6z6MZTB9u31FdkBgE+9wXjA9/pImwdPhxVLTegM/Y9EprnQhOEjhIK3tynWHYxWR
 OxDQAOaO4acnFSuG671PIl6+UF5XXXRENfws5mwdet/I1TmfsFTj4iu/VdndZQNM
 02w2H2q0pAdthVBJze1d+oZmKhavD6ei1ovpyPw5DOp9GuWRSUYceYq+RIYgUUb/
 exPYA+9O+mvPXyNgfLCqg==
X-ME-Sender: <xms:a_G2YuvEEz-zUY2rgHby-zsrmTh89sC1NPlGdh3ZZ_nCnMwHA0728g>
 <xme:a_G2YjcW8DjlbTaH9FKQwhIyY92cuv-QYzzI1Ogcxll5XZTiFzO4zAeANmyLStjeD
 KSNBMPYtG253aVC1Bk>
X-ME-Received: <xmr:a_G2Ypw3QxYBaRijH0Gg28ogDaLOP8c6v9qUnQFnAhzotmks98I8F1tYwx_HT2hBsz0t9pvb7PaEI_WTtLAxZEu9Tk8B2w9d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeguddggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfggtggusehttdertd
 dttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeelgeeuhfdtte
 dugeeludffgeelhefgiefhheefleellefhffffjedufeeftddvudenucffohhmrghinhep
 ghhithhhuhgsrdgtohhmpdhfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgr
 khgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:a_G2YpNBSK8IHErmyEllkbL_xcal3aWTx-E2QPEmUUTYUQCAVIjD7g>
 <xmx:a_G2Yu_BdbYW2DxAorL-iYtPg7_Uw1Eooev9XIN2RZvtdpfYYxN3MA>
 <xmx:a_G2YhXpmgdTO8Z9D4WDJ7QEnNcDKF8_s0FVPNMf7EganERGx3moqg>
 <xmx:a_G2YjEsDbSGPnqTPbMReH3jUojhUs6LbyxYXdvYuvj5TGrnryOwkw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jun 2022 07:28:42 -0400 (EDT)
Date: Sat, 25 Jun 2022 20:28:39 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: perex@perex.cz
Subject: attach/detach by mixer class implementation of alsa-lib mixer API
Message-ID: <YrbxZ2b+3rIdi7Ut@workstation>
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

Recent years I'm bothered about unexpected abort of pulseaudio and
pipewire processes when testing user-defined control element set.
They aborts at element removal event.

```
pulseaudio: mixer.c:149: hctl_elem_event_handler: Assertion `bag_empty(bag)' failed.
wireplumber: mixer.c:149: hctl_elem_event_handler: Assertion `bag_empty(bag)' failed.
```

Would I ask your opinion about the design of alsa-lib mixer API?

As long as I investigate, these programs seem to have careless coding as
alsa-lib mixer API application. Both of them attaches an instance of
snd_mixer_elem_t to an instance of snd_hctl_elem_t by calling
snd_mixer_elem_attach() when detecting element addition, but never detach
it even if detecting element removal.

In the case, the link list (=bag) of mixer API internal never becomes empty.
It has link entries as much as the number of registered mixer classes which
attaches snd_mixer_elem_t. Then it hits the assertion.

I think the design of alsa-lib mixer API demands mixer class implementation
to detach at element removal which attached at element addition. But I have
less conviction about it since enough unfamiliar.

I'm glad if receiving your opinion about it.

I wrote test program for the issued behaviour:
 - https://gist.github.com/takaswie/8378fe3bc04652d83428694cd7573bc0

For test, please use sample script in alsa-gobject project:
 - https://github.com/alsa-project/alsa-gobject/blob/master/samples/ctl

The patches for pulseaudio/pipewire are prepared:
 - https://gitlab.freedesktop.org/takaswie/pulseaudio/-/commit/topic/fix-wrong-handling-alsa-ctl-event
 - https://gitlab.freedesktop.org/takaswie/pipewire/-/commits/topic/fix-wrong-handling-alsa-ctl-event


Regards

Takashi Sakamoto
