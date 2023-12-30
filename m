Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C858221FE
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:29:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFBDEE7A;
	Tue,  2 Jan 2024 20:29:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFBDEE7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704223770;
	bh=DJW4lj0WMD7pcQepxg+jJb8tift75sgDVDBsBLXHk1o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q4utRq6tR8ASvZauzvI1RUXvuFXxBwgAgHmIAv6qz1S2mM0Y9LYZPBsRruZ7DYIHW
	 qHSjCdKusrYVyZSSL9JErxS5CKCfXX1RVR6d/ruHjyfv92oW1OPGeqFJ8hLbFvD7uj
	 VPLar82TSJSgiL8Zs9AfjbhvbLu0KiEJ+MJqajBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 104FFF80557; Tue,  2 Jan 2024 20:28:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76FFBF80571;
	Tue,  2 Jan 2024 20:28:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69FCEF80424; Tue,  2 Jan 2024 20:28:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 7D757F80224
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 20:28:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D757F80224
Received: from [192.168.2.4] (51b6838a.dsl.pool.telekom.hu
 [::ffff:81.182.131.138])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000072293.0000000065907AFF.0014EE4E;
 Sat, 30 Dec 2023 21:18:07 +0100
Message-ID: <3933d97638cfe57de5f9651b1f9a168bf88e43a5.camel@irl.hu>
Subject: Re: [PATCH v2 0/4] ALSA: hda/tas2781: Add tas2563 support
From: Gergo Koteles <soyer@irl.hu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Date: Sat, 30 Dec 2023 21:18:06 +0100
In-Reply-To: <87il4fwrs1.wl-tiwai@suse.de>
References: <cover.1701906455.git.soyer@irl.hu>
	 <cover.1703891777.git.soyer@irl.hu> <87il4fwrs1.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0
Message-ID-Hash: GMJT6WR3XS2FARTBPRCPNG2PDYUYB7CY
X-Message-ID-Hash: GMJT6WR3XS2FARTBPRCPNG2PDYUYB7CY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GMJT6WR3XS2FARTBPRCPNG2PDYUYB7CY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On Sat, 2023-12-30 at 17:59 +0100, Takashi Iwai wrote:
> Thanks, I guess I'll take this series later for 6.8 unless any
> objection is raised from reviewers.
>=20
> But, I'd like to hear clarifications of some points beforehand:
>=20
> - Did we get consensus about the ACPI HID?  I didn't follow the
>   previous thread completely.
>=20

The INT8866 is a (wrong) PNP ID, that should only be used by the owner
"Interphase Corporation".
Intel has also mistakenly used the INT PNP prefix in the past, and now
TI/leNovo.

>   Since those models have been already in the market for quite some
>   time, we'd have to accept "INT8866", I'm afraid.  But it's still
>   very important to know whether a similar problem can be avoided in
>   future.
>=20
> - Will be the firmware files upstreamed to linux-firmware tree later?
>   Otherwise users will have significant difficulties.

Shenghao sent the two files=C2=A0to linux-firmware@kernel.org a few days
ago, but I think the "Allegedly GPLv2+ ... Found in hex form in kernel
source." Licence needs to be fixed before acceptance.

But even if it is not included in the linux-firmware package, it is
easier for users to put two files in place per OS installation than
patching the kernel.


Regards,
Gergo

