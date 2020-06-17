Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A831FC81E
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 10:03:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 349641679;
	Wed, 17 Jun 2020 10:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 349641679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592380993;
	bh=lGWKhQghuFXA73LTT4vFkclKvN/q1n+dS6BIYrNOqiY=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YiaBG/zm+7ti7nCtogElWfFYc2QKRWnanuFn5B+Pdl4Xm8RFEFFLCE3HIS/tVb5D5
	 G/yx+X2+e/GXIhePQkV6bI4ICTdFGE4Kl5Bhj3xZnk1wLOW8o9R1NgPnbLJiXK4U34
	 vFy3lr7lPdF2qhH6TbKbfKn+i2Ck1O+Q1B/TCF0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A33EF80101;
	Wed, 17 Jun 2020 10:01:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31D38F80171; Wed, 17 Jun 2020 10:01:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DCEFF80116
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 10:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DCEFF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Uog2weu6"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="D3ffVXSQ"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 374335E0;
 Wed, 17 Jun 2020 04:01:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 17 Jun 2020 04:01:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=fm1; bh=lGWKhQghuFXA73LTT4vFkclKvN/q1n+dS6BIYrNOqiY=; b=Uog2w
 eu6G6DmAf/htsGNAOyrCD46grcz/Sa+cmrpcvNwj/x6xd1KJ9rR1PnkmewnQHwjr
 dNXuhHKkEIdRFsWrIrtzyFSrTx8HKp0ykbbpWmiMOS1krUztjz1OBVCmfTZ6e5g/
 4CsGfHvp/eX0T7w6ozfK0y6A0stNy628YkHY2VHDnK/b8slxn8aVeVb0NqbRh7LI
 ndL47u2DxRom09g4ckocuc0YvRsw/zIBOE+DmCKEFUiek8P4SpxqOlzAqxX6Wcri
 3XVdcWQ/gIKqFiCJ7SVVarQwutL4DQbyr7VCdnHRNaH5gUQ258ketsdezX8X+8n4
 +Y4OzrNZCUeUjZkKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=lGWKhQghuFXA73LTT4vFkclKvN/q1
 n+dS6BIYrNOqiY=; b=D3ffVXSQVMzAsuNKas1v1T4Sd9U7Ys0MJjh+ztb1+U6VN
 iAD52ZrdQTtL2NSbxB/7C0oGrYpZh0YtuHQ712ae3QGprUFHucr9p4FOnuEzoNcr
 hwbEb0C2g1Xot/QHrq69Z07zfAW2SkA93tE4WbPAXreP/bRQ+j/3migIHzrFtEGy
 uBI2hWPWhDPL+z2XNJVtdSnI0V458k0vb9jOJMPk/nz24v5fKGeWVI4m1Uc/7F85
 mU57FejnTvYuGQjz8fo3QhWSsi1zmYLuEgxn0Pm61ytr/28NSh7cXBn1wdJx5kDJ
 zjhrJ7DJci6Bf4b+WuIPF3PGWNAFAvKpz6B62n0iw==
X-ME-Sender: <xms:zc3pXuvmAwepqiWqmJ8RY0zn5JEE13-i1kcqwsPWkgvfgrKy-OIfvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejuddguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehttdertd
 dttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeetgfdvhedtle
 dvieehtdetgeejhffgleevgfegveelheetvdduteelffekudegheenucffohhmrghinhep
 ghhithhhuhgsrdgtohhmpdgrlhhsrgdqphhrohhjvggtthdrohhrghenucfkphepudektd
 drvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:zc3pXjeQunAYs0QjnMcUXJBr6LS-vqa18NTuh8YGfs2iW8-6dCLKug>
 <xmx:zc3pXpwpFTk70fhOZO5oEwxSMuPF4Olgyce9bB68E3kEA8OgdIjkAA>
 <xmx:zc3pXpNLGDpU5pNSxZdMzK68a3lAjo9PJsV636eCemU_-GPLDGLX4w>
 <xmx:zc3pXhIkNDUySRITxoehlofn89EClttRxkqZeDCOR4N4IdYNLWo4nA>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 78C9E328005E;
 Wed, 17 Jun 2020 04:01:16 -0400 (EDT)
Date: Wed, 17 Jun 2020 17:01:14 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: perex@perex.cz
Subject: Move ownership for repositories in Github related to
 gobject-introspection
Message-ID: <20200617080114.GA265611@workstation>
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

Now I'm going to prepare for official release of alsa-gobject v0.1.0.

At the same time, Rust binding is also OK to be released. Currently It's in
my private repository[1] but I think it better to put under alsa-project
project account in Github.

Github supports transferring ownership, and this time I'd like to utilize the
feature if you don't mind it. After transferring. some arrangement for the
repository are perhaps required; e.g. to put it to 'gobject-introspection'
team[3]. Would I ask it to you?

Additionally, I'd like to move repositories for libhinawa[4][5][6] as well,
which is required to make up control service in user space for devices
supported by ALSA firewire stack[7].

[1] https://github.com/takaswie/alsa-gobject-rs/
[2] https://help.github.com/en/github/administering-a-repository/transferring-a-repository
[3] https://github.com/orgs/alsa-project/teams/gobject-introspection
[4] https://github.com/takaswie/libhinawa
[5] https://github.com/takaswie/libhinawa-docs
[6] https://github.com/takaswie/hinawa-rs
[7] https://mailman.alsa-project.org/pipermail/alsa-devel/2020-June/168550.html

Regards

Takashi Sakamoto
