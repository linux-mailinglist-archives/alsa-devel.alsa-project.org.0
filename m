Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAA27B5460
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 15:55:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80ABAE11;
	Mon,  2 Oct 2023 15:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80ABAE11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696254951;
	bh=wodXjkvg3WGGOxLatk25xNHy2uoN+Ht6II6Y4FBjNBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tVs5NxaS0zEVtSKCU+MuOgyWGA9SqA3Hrn3Ly+4r46jXwEkKRiQhZpPWCGwMQ3krY
	 CvRBggTbXj+1r7mvqEqmm3Rt2QpXYximw+bg5nV2i9aZdyutwFGP3h/quZwgVD7iT+
	 Z1Jk1/8He9iOQB5Ig/KIHDyf80N84zHzOaUWylx4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83BEDF8047D; Mon,  2 Oct 2023 15:54:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00046F802E8;
	Mon,  2 Oct 2023 15:54:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38BDEF80310; Mon,  2 Oct 2023 15:54:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA5A6F800C1
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 15:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA5A6F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=wmZJVmYE
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CC83F9C284E;
	Mon,  2 Oct 2023 09:54:30 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 5dk_7z5j0X8T; Mon,  2 Oct 2023 09:54:30 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 438EC9C28CB;
	Mon,  2 Oct 2023 09:54:30 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 438EC9C28CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1696254870; bh=VOhLDE4guYQyg/wALA55JZ6elxZ+BJaLxqSVBh30BYw=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=wmZJVmYEKhrNtNRw6OTedHQPdp+xbTFDIE86uBxGhUzMxLq8ExHrBiNZ/hJ20OpO+
	 FulZ+036wubqcvzi+f/YiBSPn5qm8MAfa5PxHQlzCG3aI0r80KY/9Z2h2++aDV7Zcm
	 324c29l2gbKu0ViNRJ9E/9XHkEj/DvopjcHMw8Teeaivpjo7n5fUgDItYGv9yoqPwH
	 tOAriO0txjQQS6gYtxzO9ewY9vqe3AQF4NpNVgTzFDvVYOxm/ATPp9d1Yz/UoPMgH2
	 VwA3CHLYj473c2tYjWOFXqwh4drWnIWGEVxParWrIJH3VgAnmAkawfD/YvQzqtfL66
	 z6BZ7tGpGzTEA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id msSSIJSOvmn5; Mon,  2 Oct 2023 09:54:30 -0400 (EDT)
Received: from t14pdgleonec.localnet
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 8D9129C284E;
	Mon,  2 Oct 2023 09:54:29 -0400 (EDT)
From: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>
To: elinor.montmasson@savoirfairelinux.com, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Xiubo.Lee@gmail.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH 01/10] ASoC: fsl-asoc-card: add new compatible for dummy
 codec
Date: Mon, 02 Oct 2023 15:54:28 +0200
Message-ID: <5105906.Z0T98nBDOH@t14pdgleonec>
In-Reply-To: 
 <CAA+D8AM3RyrWOB4pmYgF4+q+X7Ro7coyDbGpsC4qzg_NX20N6Q@mail.gmail.com>
References: <20230901144550.520072-1-elinor.montmasson@savoirfairelinux.com>
 <20230901144550.520072-2-elinor.montmasson@savoirfairelinux.com>
 <CAA+D8AM3RyrWOB4pmYgF4+q+X7Ro7coyDbGpsC4qzg_NX20N6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Message-ID-Hash: 4OQEZ44HYRHGWBV5VUEPSP5TRNSPMGRM
X-Message-ID-Hash: 4OQEZ44HYRHGWBV5VUEPSP5TRNSPMGRM
X-MailFrom: philip-dylan.gleonec@savoirfairelinux.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4OQEZ44HYRHGWBV5VUEPSP5TRNSPMGRM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On lundi 11 septembre 2023 10:21:17 CEST Shengjiu Wang wrote:
> Add Mark
> 
> In the "Question about simple-audio-card with dummy CODEC"
> Mark said dummy codec may not be used. we should have a driver
> to describe the codec.
> 
> Best regards
> wang shengjiu

Hello,

I'm following up since Elinor is currently absent.
I had the opportunity to meet Mark and asked for his advice: we will modify 
the patchset to use the spdif_receiver and spdif_transceiver codecs instead of 
the dummy codec. 
Thanks for the review.

Best regards,
Philip-Dylan Gleonec


