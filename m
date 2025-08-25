Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 837F5B34CB3
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Aug 2025 22:51:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7C70601F0;
	Mon, 25 Aug 2025 22:51:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7C70601F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756155077;
	bh=cHXDdyiNo6b19R4yUV3vrvDh4+5xHSygmj+5Ns5ccz8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Pli7ugWYcNTOyEHLwiQewZqCVhG+TYIhbqeaemuDaoJSuTRjvbabEMrh8LSXouArN
	 QI4zwWHG/PyRH5oYK5heUKUV6BLsy3+jrd3g8tnTm5tN6jKF316MzdJdneudu1k3xI
	 4OS2N0wA5gY6ueTFDiuLv06uw0wJWia/Jv2+qDkk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D756EF805D5; Mon, 25 Aug 2025 22:50:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90783F805BB;
	Mon, 25 Aug 2025 22:50:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39CC5F804B0; Mon, 25 Aug 2025 22:50:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A5843F800B0
	for <alsa-devel@alsa-project.org>; Mon, 25 Aug 2025 22:50:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5843F800B0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <185f1db067fd9d00-webhooks-bot@alsa-project.org>
In-Reply-To: <185f1db0667bdd00-webhooks-bot@alsa-project.org>
References: <185f1db0667bdd00-webhooks-bot@alsa-project.org>
Subject: my duo cast volume is too low
Date: Mon, 25 Aug 2025 22:50:27 +0200 (CEST)
Message-ID-Hash: JHISCPC7LKSR5ODREJPVGXMBZMLP4PY2
X-Message-ID-Hash: JHISCPC7LKSR5ODREJPVGXMBZMLP4PY2
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHISCPC7LKSR5ODREJPVGXMBZMLP4PY2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #604 was opened from reflexionn:

hello i bought the hyperx duocast mic for recording reasons i have a small youtube channel that goes by the name vironio i was dissapointed with the mic performance because it has very low volume and if i wanna record i have to be uncomfortably close to the microphone i thought thats just how the mic is and i lived with it i set the gain to around 70% because anything more would lead to weird noise that comes from the mic itself and i just record and then put the recording in adobe audition add a lot of effects and noise cancelation and audio gate and then i amplify the audio by around 9db so its hearable but not so long ago i saw a tiktoker with the same mic but he has a much higher volume and can use the microphone from around 2 to 3 inches away with the quality being really good so i thought its not actually the mics fault and i just didnt set it up right can anyone help me?

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/604
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
