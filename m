Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 126E8909EFB
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jun 2024 20:08:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CDBF868;
	Sun, 16 Jun 2024 20:08:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CDBF868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718561325;
	bh=zQpt/KOTN1mT5M1C2lwXEYoYFxmtE7HL1hRnOr8ZtNQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nzV2PBkpeYNUrDBjylOREhIxVSR7P5vEvWjcXs0smQbyhErKQZ7cejOZt5MS/ZfjJ
	 65QBsaGzxgkfiDmAaCwD7ku3/7F8k4wWLU2Hmr3zzZCQ2GbDaGyCQWkdj6Jl5bs7IF
	 H5to5RXgmp7gY35BvVUg3n2aVe+TS8epyS9/8n9E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 995FFF805B1; Sun, 16 Jun 2024 20:08:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9D0BF804D6;
	Sun, 16 Jun 2024 20:08:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3959F8023A; Sun, 16 Jun 2024 20:08:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id D4028F800ED
	for <alsa-devel@alsa-project.org>; Sun, 16 Jun 2024 20:08:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4028F800ED
Received: from fedori.lan (c3e47615.dsl.pool.telekom.hu
 [::ffff:195.228.118.21])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000070EF5.00000000666F29FF.0023D54E;
 Sun, 16 Jun 2024 20:07:58 +0200
Message-ID: <2c9ba341bc95d4b9010bf5f8794c0d14b1c57dc9.camel@irl.hu>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Enable headset mic on IdeaPad
 330-17IKB 81DM
From: Gergo Koteles <soyer@irl.hu>
To: Ajrat Makhmutov <rautyrauty@gmail.com>,
  alsa-devel@alsa-project.org
Cc: perex@perex.cz, tiwai@suse.com, kailang@realtek.com,
  sbinding@opensource.cirrus.com, luke@ljones.dev,
  shenghao-ding@ti.com, simont@opensource.cirrus.com,
  foss@athaariq.my.id, rf@opensource.cirrus.com, wzhd@ustc.edu,
  linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sun, 16 Jun 2024 20:07:57 +0200
In-Reply-To: <20240615125457.167844-1-rauty@altlinux.org>
References: <20240615125457.167844-1-rauty@altlinux.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
Message-ID-Hash: VANW77ZQUUPDFYOMBIUH37OQ4OTE6UNK
X-Message-ID-Hash: VANW77ZQUUPDFYOMBIUH37OQ4OTE6UNK
X-MailFrom: soyer@irl.hu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VANW77ZQUUPDFYOMBIUH37OQ4OTE6UNK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Ajrat,

On Sat, 2024-06-15 at 15:54 +0300, Ajrat Makhmutov wrote:
> Headset microphone do not work out of the box with this laptop. This
> quirk fixes it. Zihao Wang specified the wrong subsystem id in his patch.

The 17aa:3820 is the Duet 7 ITL6's PCI SSID, so I don't think it's a
mistake. It is just a PCI SSID - codec SSID collision.

Here is an ITL6 probe:
https://linux-hardware.org/?probe=3Dd3d4d3dea3

There are some similar collisions with Lenovo laptops.
Please see commit 0ac32a396e4f41e88df76ce2282423188a2d2ed0 for an
example how to handle one.

Best regards,
Gergo


