Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F1A84D6C6
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 00:50:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7C5384A;
	Thu,  8 Feb 2024 00:49:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7C5384A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707349803;
	bh=byES4n0K3so3aUygYY5m0e3z3k70nM326q/F378hiBQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=moV8U+2B76Jn0Ghd5Gml2RFdYH5AP0MkNLfUZxoup9N1/3XWl+irXbztG+e+k283W
	 S6VF4hD+aIUCzOzmTmn1mPZTL2fLzWMrFri+3XFMXQVTrDhlklmr2mnavwYo5hxA2C
	 y57C7hH0f1LavWieekkK1Uhg729gQfhsRFz3ZlnY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91D46F8056F; Thu,  8 Feb 2024 00:49:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D66D9F8057D;
	Thu,  8 Feb 2024 00:49:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41D00F801EB; Thu,  8 Feb 2024 00:49:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id ECC14F800E3
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 00:49:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECC14F800E3
Received: from [192.168.2.4] (51b69e54.dsl.pool.telekom.hu
 [::ffff:81.182.158.84])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000074519.0000000065C416F7.001B05BA;
 Thu, 08 Feb 2024 00:49:11 +0100
Message-ID: <b762e167bb15c8dca954ba4bea4a27e06a019a9d.camel@irl.hu>
Subject: Re: [PATCH v3] ASoC: tas2781: remove unused acpi_subysystem_id
From: Gergo Koteles <soyer@irl.hu>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
  alsa-devel@alsa-project.org, stable@vger.kernel.org
Date: Thu, 08 Feb 2024 00:49:10 +0100
In-Reply-To: <ZcNWcqYEmUjtusfe@finisterre.sirena.org.uk>
References: 
	<df5c94396256e9573b772962182def52d20c50d4.1707250969.git.soyer@irl.hu>
	 <7f056a4148fec176812ff6cc490860bf565b161c.1707255917.git.soyer@irl.hu>
	 <ZcNWcqYEmUjtusfe@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
Message-ID-Hash: BYXWHTNVYLU4XJ2PE7TNYFCLXYQTP3WO
X-Message-ID-Hash: BYXWHTNVYLU4XJ2PE7TNYFCLXYQTP3WO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BYXWHTNVYLU4XJ2PE7TNYFCLXYQTP3WO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

On Wed, 2024-02-07 at 10:07 +0000, Mark Brown wrote:
> On Tue, Feb 06, 2024 at 10:49:29PM +0100, Gergo Koteles wrote:
> > The acpi_subysystem_id is only written and freed, not read, so
> > unnecessary.
>=20
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.

Alright. I read somewhere once.
Sorry for the noise.

thanks,
Gergo

