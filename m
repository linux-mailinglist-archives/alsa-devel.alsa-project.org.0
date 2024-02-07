Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 822E984D68C
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 00:25:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 991A8846;
	Thu,  8 Feb 2024 00:24:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 991A8846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707348308;
	bh=YfRV9IXEHzwUlaK44nivdzdyF+BT5NriNyRCfusq6cE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qhvmW9tmKuUIg7pAW6344DgbNymt4oDwB6ptjf2OpxDxkM/JJgq/PFXU7DVSxgbzj
	 DWkC6Lf0UCOM//2p/UOq19/Sn8vw56JzBVYyEA8LHNrGqDkw3OTm9vxKxSR0oD2Ggr
	 9CB9NPL7227W+i/FdKrhpsFuNUa2HAd9UO/WBUNA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84DF3F805A0; Thu,  8 Feb 2024 00:24:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7DA8F805A1;
	Thu,  8 Feb 2024 00:24:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96783F801EB; Thu,  8 Feb 2024 00:24:32 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id DFF1BF800E3
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 00:24:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFF1BF800E3
Received: from [192.168.2.4] (51b69e54.dsl.pool.telekom.hu
 [::ffff:81.182.158.84])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000007450D.0000000065C41127.001B0535;
 Thu, 08 Feb 2024 00:24:23 +0100
Message-ID: <f49b85d2045fc6960088166374c73f79b551f6c2.camel@irl.hu>
Subject: Re: [PATCH] ASoC: tas2781: remove unused acpi_subysystem_id
From: Gergo Koteles <soyer@irl.hu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  stable@vger.kernel.org
Date: Thu, 08 Feb 2024 00:24:22 +0100
In-Reply-To: <2024020745-freight-slush-9ae7@gregkh>
References: 
	<df5c94396256e9573b772962182def52d20c50d4.1707250969.git.soyer@irl.hu>
	 <2024020745-freight-slush-9ae7@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
Message-ID-Hash: V7ZLHSPYQ4SES7CSXEKWOFLDG7UDUO7O
X-Message-ID-Hash: V7ZLHSPYQ4SES7CSXEKWOFLDG7UDUO7O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V7ZLHSPYQ4SES7CSXEKWOFLDG7UDUO7O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Greg,

On Wed, 2024-02-07 at 10:02 +0000, Greg KH wrote:
> On Tue, Feb 06, 2024 at 09:25:50PM +0100, Gergo Koteles wrote:
> > The acpi_subysystem_id is only written and freed, not read, so
> > unnecessary.
> >=20
> > Fixes: ef3bcde75d06 ("ASoC: tas2781: Add tas2781 driver")
>=20
> What does this really "fix"?  It's just a cleanup.
>=20
> > CC: stable@vger.kernel.org
>=20
> Again, what bug is this fixing?
>=20
> Please read:
>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.ht=
ml
> about what should be tagged for stable kernels, which this patch series
> does not seem to fix.
>=20

Yes, you are right, this is not really a bug.
I took the scope of "oh, that's not good" too wide.
Sorry for the noise.

thanks,
Gergo


