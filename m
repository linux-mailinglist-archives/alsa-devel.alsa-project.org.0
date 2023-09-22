Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9314A7AB2F6
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 15:46:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86E9EDF8;
	Fri, 22 Sep 2023 15:46:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86E9EDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695390417;
	bh=C6hSm4/guJqzFk1sj8f9w5GZLn1kmRcMMa1StlR+duI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TDYewZ4+zQ3VgqSksQQYwTwv6R7QgcryIn7/Bf7YKUTaxafBiDKeXCqBu9gqPoa6O
	 5ZF/n02m6WdvCk5gcT5zfoCLyWI09xERQ0ypn2J196O3cgHfl25BglLzIyYNnxV/Ks
	 OC/xtvt+j0JiHzsoOcO9IlcvZtcpuDK5AYQABBpU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05094F8055A; Fri, 22 Sep 2023 15:46:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA007F800F4;
	Fri, 22 Sep 2023 15:46:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDAC6F80125; Fri, 22 Sep 2023 15:46:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3C72F800AA
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 15:45:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3C72F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=biE04lp+
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BC371BF20D;
	Fri, 22 Sep 2023 13:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695390352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3d45HSdjEBrGWXzT/hFE6ZoKYqY81rYCMtjLk2B/bLE=;
	b=biE04lp+7hE+NLdqozy2BgZPaAjb3vaTtdsBnKCNRXF0qN2XFtgDbT6n4cqLkcqbHptxLb
	oeMOmF7eHyF3aNQjMyD5QaHQjivx7ot6sdz0fFd0QcreP+88erVcjSDntCACDudD3RcyQH
	iK/3cWyQ7W7XAH8Riv34zdtaG/ZaF9U8gRbBkmmXP9wtu9Dpmv+8fBGDH2uHlFgTVuaf+D
	vUEEo2o7OwBll3KiAvIkjzGSfu3326QoSexo+bH5ppzRDvkVMmXLebD7B12+Z2XnIyyhNX
	ouCNBvOA0rABVPgSWhVwNkW32WK4XjYvnXpRZzPaNCdSCfw9y1M3ExfRT98Eow==
Date: Fri, 22 Sep 2023 15:45:46 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Randy Dunlap
 <rdunlap@infradead.org>, Takashi Iwai <tiwai@suse.com>, Simon Horman
 <horms@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood
 <lgirdwood@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-gpio@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, netdev@vger.kernel.org, Fabio Estevam
 <festevam@gmail.com>, Eric Dumazet <edumazet@google.com>, Andrew Lunn
 <andrew@lunn.ch>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Mark Brown
 <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 alsa-devel@alsa-project.org, Paolo Abeni <pabeni@redhat.com>, Lee Jones
 <lee@kernel.org>, linux-kernel@vger.kernel.org, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Xiubo Li
 <Xiubo.Lee@gmail.com>, Rob Herring <robh+dt@kernel.org>, Shengjiu Wan g
 <shengjiu.wang@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Qiang Zhao
 <qiang.zhao@nxp.com>
Subject: Re: [PATCH v6 25/30] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Message-ID: <20230922154546.4ca18b6f@bootlin.com>
In-Reply-To: <169538601225.2919383.2942072541503354871.robh@kernel.org>
References: <20230922075913.422435-1-herve.codina@bootlin.com>
	<20230922075913.422435-26-herve.codina@bootlin.com>
	<169538601225.2919383.2942072541503354871.robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: B4SAPUDGCT6AIFJRNPIDRRIWBA2NQ6VA
X-Message-ID-Hash: B4SAPUDGCT6AIFJRNPIDRRIWBA2NQ6VA
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4SAPUDGCT6AIFJRNPIDRRIWBA2NQ6VA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Rob,

On Fri, 22 Sep 2023 07:33:32 -0500
Rob Herring <robh@kernel.org> wrote:

> On Fri, 22 Sep 2023 09:59:00 +0200, Herve Codina wrote:
> > The Lantiq PEF2256 is a framer and line interface component designed to
> > fulfill all required interfacing between an analog E1/T1/J1 line and the
> > digital PCM system highway/H.100 bus.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > ---
> >  .../bindings/net/lantiq,pef2256.yaml          | 214 ++++++++++++++++++
> >  1 file changed, 214 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
> >   
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/lantiq,pef2256.yaml: properties:lantiq,data-rate-bps: '$ref' should not be valid under {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> 

The '-bps' suffix was added recently in
https://github.com/devicetree-org/dt-schema/
commit 033d0b1 ("Add '-bps' as a standard unit suffix for bits per second")

This commit is not yet present in any dt-schema release.

Should I update my patch (ie. removing $ref) right now even if this update will
make the last dt-schema release not happy ?

Regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
