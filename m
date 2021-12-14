Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E712E474AEF
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 19:29:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22C7C2054;
	Tue, 14 Dec 2021 19:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22C7C2054
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639506591;
	bh=BR2qDXNKNKVk8yQ0KG1Y9Y1xpHQPnJBpsphvzPigeUg=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kUQMDLOXldyjIpzGucHRy6C2VXyX7t5wRHyOnVACAK624mFa6h0aRUkbB+SsMLm+D
	 c/8RzK32WomA/V2M0E1v0BmvsvEEZzAtTq5AJykQo+wvdrA0ymAhlF080hHV2KoSy2
	 gWfJqnCBhQAARpn7AaZ8oJKXspzjg8HI2n1qVCAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86D32F80249;
	Tue, 14 Dec 2021 19:28:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BBD5F80246; Tue, 14 Dec 2021 19:28:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from msg-6.mailo.com (ip-16.mailobj.net [213.182.54.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 865CEF800FE
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 19:28:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 865CEF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org
 header.b="kfNOwJNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
 t=1639506500; bh=BR2qDXNKNKVk8yQ0KG1Y9Y1xpHQPnJBpsphvzPigeUg=;
 h=X-EA-Auth:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
 References:Content-Type:MIME-Version:Content-Transfer-Encoding;
 b=kfNOwJNJvSgyOpXQBzdxLUqrgIsJxPamOrfMzG0VvgoAglXw/PnX6SGekEKT7UQ9L
 2Qn6S4tWoSllN3lArrcFLx1p3ZXbwuWW1UoIUkmWw8+ejIHnDM3Ji7IwC2Xd3t6DYA
 q5nK4dtpl/6DOWDM9lJF54CfshXUCpeXTASCV1Jk=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
 via proxy.mailoo.org [213.182.55.207]
 Tue, 14 Dec 2021 19:28:20 +0100 (CET)
X-EA-Auth: ZrbCefZvrR0MW3Fdl0zMedxelWrqSsj6Ao2YUQhL2yMarudqVTdrpgzaD7ksuVv62skx57agflarrPJkttU06rOjdpD0+L6FbsKpzqyunx4=
Message-ID: <fa40932c2dfbfcbdefa976f9609bdfca10fdd9cf.camel@mailoo.org>
Subject: Re: [PATCH 2/2] ASoC: Add AK4375 support
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 14 Dec 2021 19:28:19 +0100
In-Reply-To: <YbeZ37FLnAsMfrDl@sirena.org.uk>
References: <20211213155914.2558902-1-vincent.knecht@mailoo.org>
 <20211213155914.2558902-2-vincent.knecht@mailoo.org>
 <YbeZ37FLnAsMfrDl@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 obayerd@eurocomposant.fr, stephan@gerhold.net, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Le lundi 13 d=C3=A9cembre 2021 =C3=A0 19:07 +0000, Mark Brown a =C3=A9crit=
=C2=A0:
> On Mon, Dec 13, 2021 at 04:59:12PM +0100, Vincent Knecht wrote:
>=20
> > AK4375 is a 32-bit stereo DAC with headphones amplifier.
> > There's no documentation for it on akm.com, and only a brief
> > datasheet can be found floating on the internets [1].
>=20
> This driver looks relatively clean but it's in *serious* need of
> modernisation, there's issues here that haven't been present upstream
> for a very long time.=C2=A0 Fortunately they're mostly style things so it
> should be relatively easy to handle.

Thank you Mark for this review, hopefully I'll fix all points
and submit a v2 within a week or so.



