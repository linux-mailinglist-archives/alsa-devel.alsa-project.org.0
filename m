Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BACB83B450
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 22:55:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F8BB828;
	Wed, 24 Jan 2024 22:55:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F8BB828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706133357;
	bh=309aYL4WHgnoj7cp3YCClCX/HORT29FwxxqIu388QIM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bgAzmirAU5Lk5Sja704LMe0sUSa+ZjLh9/8YARk2TpfWf9kSaFdF0jWw5golyYEyk
	 n7zJRWDj9tx0zEVVGEHvlINdjnHY24qsvPD92KhtEZEWZ+d+ux9qi8gvKkuN/yQxJP
	 mabeqC5gxaaYKBP4eJq1IhBguINf6d50MJe/f4d0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0452F80494; Wed, 24 Jan 2024 22:55:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DA8EF80494;
	Wed, 24 Jan 2024 22:55:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41915F8028D; Wed, 24 Jan 2024 22:55:20 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 8D75CF8022B
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 22:55:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D75CF8022B
Received: from [192.168.2.4] (51b68f75.dsl.pool.telekom.hu
 [::ffff:81.182.143.117])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000070DBE.0000000065B1873B.0018A6D1;
 Wed, 24 Jan 2024 22:55:07 +0100
Message-ID: <4dbee9d8524da296b185ba0fe6827249c93eebd6.camel@irl.hu>
Subject: Re: [PATCH 0/2] ALSA: hda: Move component binding support into
 separate library
From: Gergo Koteles <soyer@irl.hu>
To: Richard Fitzgerald <rf@opensource.cirrus.com>, tiwai@suse.com,
  shenghao-ding@ti.com
Cc: perex@perex.cz, linux-kernel@vger.kernel.org,
  linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
  patches@opensource.cirrus.com
Date: Wed, 24 Jan 2024 22:55:07 +0100
In-Reply-To: <20240124112607.77614-1-rf@opensource.cirrus.com>
References: <20240124112607.77614-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
Message-ID-Hash: 2GVWVY4VIJ7AOJXN3DLRPZLXYIJ7QXQD
X-Message-ID-Hash: 2GVWVY4VIJ7AOJXN3DLRPZLXYIJ7QXQD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2GVWVY4VIJ7AOJXN3DLRPZLXYIJ7QXQD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Richard,

On Wed, 2024-01-24 at 11:26 +0000, Richard Fitzgerald wrote:
> The Cirrus Logic amplifiers are currently paired with Realtek HDA codecs.
> But they could be used with other codecs. To prepare for this, these two
> patches move the manager side of the component binding out of the Realtek
> driver into a library module.
>=20
> The first patch tweaks the CS35L41 code so that it is not hardcoded to
> CS35L41, and changes the TAS2781 handling so that it re-uses that code
> instead of having a near-identical copy of it.
>=20
> Can someone please test that these two patches don't break TAS2781?
> I have checked that they should work in theory but I don't have hardware
> to test on.
>=20

It works on a Lenovo Yoga 7 14ARB7 laptop.

Tested-by: Gergo Koteles <soyer@irl.hu>

Regards,
Gergo

> Richard Fitzgerald (2):
>   ALSA: hda: realtek: Re-work CS35L41 fixups to re-use for other amps
>   ALSA: hda: realtek: Move hda_component implementation to module
>=20
>  MAINTAINERS                   |   1 +
>  sound/pci/hda/Kconfig         |   4 +
>  sound/pci/hda/Makefile        |   2 +
>  sound/pci/hda/hda_component.c | 169 ++++++++++++++++++++++++++
>  sound/pci/hda/hda_component.h |  59 +++++++++
>  sound/pci/hda/patch_realtek.c | 217 ++++------------------------------
>  6 files changed, 261 insertions(+), 191 deletions(-)
>  create mode 100644 sound/pci/hda/hda_component.c
>=20

