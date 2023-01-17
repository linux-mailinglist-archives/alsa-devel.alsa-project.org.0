Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3984A66D94E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 10:07:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 911B064BF;
	Tue, 17 Jan 2023 10:06:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 911B064BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673946444;
	bh=BUX/6hlTgsSEkvYnvs/GaMFqO/NuMR49KtFfCSuoJFc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=NOxX7MW6neNnlf+y6YL+ixYrNCLNq3TMkgSb7nq4GQ9EEzozn4rsxCPZNKHKkfUAj
	 sMLarp3xwFuaxh2Qdk5kPAzlR5Ymkef6uUUPHuNbFbcbPqTHyJ4nPs+0xi5Sqjlm/z
	 0RvwYNGKdcrStnDhEtXBmc/OkARZUoyA1OmpyzSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFECCF8022D;
	Tue, 17 Jan 2023 10:06:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACE9AF804DE; Tue, 17 Jan 2023 10:06:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3983BF8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 10:06:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3983BF8023A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=BKpkK/uu; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=KXodEdAg
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 3F6295C00E4;
 Tue, 17 Jan 2023 04:06:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 17 Jan 2023 04:06:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1673946375; x=1674032775; bh=bBFBHdgUEx
 DtLc/7PnHuZCFolfc8GR5+frlbC+WuxQ4=; b=BKpkK/uu5m1z1sNkezqUciat0Z
 KCxQJIb8Uqfsca0VG2Hq1sKEJYBpKQ5S5Zd2AKuodusHQ4F7KczG7NBQD0AyBPWE
 Om1HJOFqA6c6BnpILuW5eTr70Y+NAXGVCbDYAos416zhrr10Dxhlq6Y8Ay6vQZMb
 Bzw440eknpSGWtpww9t83FiRT0RDmzLzN+rjU4VdM/V4ei6L8m34n/kPu5IIEWjz
 vVjOO8lsCbeXMMtBJN3t2F23sS6atOEOw+Gp/K3CH1TM8ohfJhVkFTi9wy2/s5Al
 h1vw4jKrcc6JhMWt8wtPwMExwGQ56DFVNM9jUB0DcEMPTl2NDlUwv1/HG1YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1673946375; x=1674032775; bh=bBFBHdgUExDtLc/7PnHuZCFolfc8GR5+frl
 bC+WuxQ4=; b=KXodEdAgLxLnX5G0K3mUsjlOBNf5clBOSH7kW8zTuZVzun+LG5I
 fFn2BZ+QLh7ahpiFcmCsmHP22HDavDgrpSjkiBdx2XfFctWb0RsbByFua0eOxMOl
 qzePwDrad0fG4n7eWk07XyX4NC4fpf8/8WhfSVqTOvvsR3ozz+9ugnZZcF5Kum9G
 Mc/vLZAASa5MJG6pVzv1Y6Q+5am3nOyjndFs0eVCqp5yJWYPtKkjuunLgmXsZuXO
 wZ3o6uEDnOlI13pylrCDJFp3ebsu/LzGZinjuWtIozTiI1jJgcYZaeWW/dqmXgJ9
 IQc8zddcn4fpRxov00Mz95+jC3kpyt3MaBw==
X-ME-Sender: <xms:BmXGY9nYlvb3T1sNjzAcBwreLwH5fmMcHuU8OfcXeNoZ2DvkBP9GgA>
 <xme:BmXGY41mD-MTV-u4bgAK_FN8-i_gw70_jMbJHGdVL5l_BDEO3DJzipJa1mpgQ7bwS
 rSjBQkHba_UUkW5xbE>
X-ME-Received: <xmr:BmXGYzqwDUugU_Oeqeg8dBjvCzmmf7yZFwtJQtUp45AcqW1HvKwTi-5RQ6oSxuw4SC7XkIU1Mj1JjyuktzWw4fQp-r9VVF3P1_-gtCkSOCWI09QQmmgRSaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddthedgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepffdvueelff
 evkeduhfetjeduffeghfettdfguedtgfdvgfeufeduheevheevkeeknecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:BmXGY9mQg0d_jSwkaIVRtzdcPNaGMzsznzqNXQPhFpN9MBVIIlEBGQ>
 <xmx:BmXGY71md5kfUijFt804Yxo97Bu87av6gMt7LziVvovdTycF4jfU4Q>
 <xmx:BmXGY8soR7utB0zHDzNI_WH1_LSAvZO9Zlnq4ABEr3Ai6KStYu3vNA>
 <xmx:B2XGY5CuT-p34ph1JC6Cha2StnKOWmaw9Peq9FQbw-N5Iw0zWtA4DA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 04:06:13 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/1] firewire: fix memory leak for payload of request
 subaction to IEC 61883-1 FCP region
Date: Tue, 17 Jan 2023 18:06:09 +0900
Message-Id: <20230117090610.93792-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

This single patch fixes a bug of Linux FireWire subsystem for kernel
v2.6.33 or later. In detail, please refer patch comment.

My intension of this cover-letter is to request sound subsystem maintainer
to send it to mainline since upstream of Linux FireWire subsystem is
already inactive.

To Iwai-san, I would be pleased if you alternatively send it to mainline.


Thanks

Takashi Sakamoto (1):
  firewire: fix memory leak for payload of request subaction to IEC
    61883-1 FCP region

 drivers/firewire/core-cdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.37.2

