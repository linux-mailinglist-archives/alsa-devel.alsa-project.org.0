Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94427B3D9BC
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Sep 2025 08:19:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE5D5601ED;
	Mon,  1 Sep 2025 08:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE5D5601ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756707542;
	bh=EL5EUGq8LjnKRlfCJg4tsx/HSlRVDTMR+MzapSY6WBc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rik1VTAQxKWCGYJQwpypVbEE93Jmu0M4Y4FRMyj7gUf4O0MqTXDk5Vm2NIJ9Nmo2N
	 vZnXuN4YgB57OkmbkCQkfQmI/tvnH74syOK0fnaa7HA7UqNdjoeOTg3u+dKwdMWiJu
	 mJBzvNd3LljqOL6yoyPrUssYVqKXf3HRbzBzSbys=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0360F80549; Mon,  1 Sep 2025 08:18:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BBC2F80549;
	Mon,  1 Sep 2025 08:18:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73E04F804FF; Mon,  1 Sep 2025 08:18:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id CD5CDF80027
	for <alsa-devel@alsa-project.org>; Mon,  1 Sep 2025 08:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD5CDF80027
Received: from [192.168.2.4] (51b694d5.dsl.pool.telekom.hu
 [::ffff:81.182.148.213])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000088D4E.0000000068B53A9F.002405C5;
 Mon, 01 Sep 2025 08:18:07 +0200
Message-ID: <3afb62060097eeafbf9faed33654f7f6612596f4.camel@irl.hu>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Fix the order of TAS2563
 calibrated-data
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, tiwai@suse.de
Cc: broonie@kernel.org, andriy.shevchenko@linux.intel.com,
  13564923607@139.com, 13916275206@139.com,
  alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
  baojun.xu@ti.com, Baojun.Xu@fpt.com
Date: Mon, 01 Sep 2025 08:18:06 +0200
In-Reply-To: <20250831124313.438-1-shenghao-ding@ti.com>
References: <20250831124313.438-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
Message-ID-Hash: 4GJAUWCSCS55HCIOG6RRQ2ZYFGKSG3MI
X-Message-ID-Hash: 4GJAUWCSCS55HCIOG6RRQ2ZYFGKSG3MI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4GJAUWCSCS55HCIOG6RRQ2ZYFGKSG3MI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shenghao,

On Sun, 2025-08-31 at 20:43 +0800, Shenghao Ding wrote:
> A bug reported by one of my customers that the order of TAS2563
> calibrated-data is incorrect, the correct way is to move R0_Low_%d
> and insert it between R0_%d and InvR0_%d.
>=20

A similar fix is =E2=80=8B=E2=80=8Balready in Takashi's tree for tas2563.
https://lore.kernel.org/all/20250829160450.66623-1-soyer@irl.hu/

But I think, tas2781 also needs one for the order and one for the
endianness.
I left it out because it's easier for you with documentation.

Gergo
