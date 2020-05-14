Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 493A41D3864
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 19:35:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9CFC1666;
	Thu, 14 May 2020 19:34:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9CFC1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589477727;
	bh=KaeRnwISk4xJsr2+yYWljcRz6x8l52wFZXH8fnEbFI0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W593K+fHI2aJUgt/Fut4hhZf/NadWhET1VmbK0YJVyoQYPJ/EioYZwuhOaK/XSFXE
	 iTGRHkj72ORCHaDD1X8oPK8nMuKl+WxJ1UlnBMFx776H39Gckgn68IyZxHqsQa7cAl
	 pCcH3UO8KJmKxdLoxKTxxXMkUXIHilam7PHxL1Bg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF65EF80158;
	Thu, 14 May 2020 19:33:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08F5BF8014C; Thu, 14 May 2020 19:33:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from zm-mta-out-3.u-ga.fr (zm-mta-out-3.u-ga.fr [152.77.200.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F578F800E3
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 19:33:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F578F800E3
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 35DD640E19;
 Thu, 14 May 2020 19:33:33 +0200 (CEST)
Received: from zm-mbx05.u-ga.fr (zm-mbx05.u-ga.fr [152.77.200.19])
 by zm-mta-out.u-ga.fr (Postfix) with ESMTP id 2E1F780474;
 Thu, 14 May 2020 19:33:33 +0200 (CEST)
Date: Thu, 14 May 2020 19:33:33 +0200 (CEST)
From: =?utf-8?B?RlLDiUTDiVJJQw==?= RECOULES
 <frederic.recoules@univ-grenoble-alpes.fr>
To: tiwai <tiwai@suse.de>
Message-ID: <1131275890.17479572.1589477613169.JavaMail.zimbra@univ-grenoble-alpes.fr>
In-Reply-To: <s5h5zd87qcq.wl-tiwai@suse.de>
References: <20200506171924.2644-1-frederic.recoules@univ-grenoble-alpes.fr>
 <s5h5zd87qcq.wl-tiwai@suse.de>
Subject: Re: [PATCH v3 1/5] pcm_dmix assembly: change the token by symbolic
 names
MIME-Version: 1.0
X-Originating-IP: [92.184.112.140]
X-Mailer: Zimbra 8.8.15_GA_3928 (ZimbraWebClient - FF72 (Linux)/8.8.15_GA_3928)
Thread-Topic: pcm_dmix assembly: change the token by symbolic names
Thread-Index: 8F1b9jE7vDb80Ap4CLmSCALzXdxPXQ==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 frederic recoules <frederic.recoules@orange.fr>
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

Hi Takashi,=20

I am quite late (I was very busy these days) but thank you for applying the=
 patches.=20

I wish you well,=20
Regards,=20

Fr=C3=A9d=C3=A9ric=20


De: "tiwai" <tiwai@suse.de>=20
=C3=80: "frederic recoules" <frederic.recoules@univ-grenoble-alpes.fr>=20
Cc: "alsa-devel" <alsa-devel@alsa-project.org>, "frederic recoules" <freder=
ic.recoules@orange.fr>=20
Envoy=C3=A9: Mercredi 6 Mai 2020 22:36:37=20
Objet: Re: [PATCH v3 1/5] pcm_dmix assembly: change the token by symbolic n=
ames=20

On Wed, 06 May 2020 19:19:20 +0200,=20
frederic.recoules@univ-grenoble-alpes.fr wrote:=20
>=20
> From: Fr=C3=A9d=C3=A9ric Recoules <frederic.recoules@orange.fr>=20
>=20
> It eases the refactoring of assembly chunk since we can now=20
> add/remove/move entries without worrying about maintaining=20
> the token numbering in the template.=20
>=20
> Note: does not impact the binary output.=20
>=20
> Signed-off-by: Fr=C3=A9d=C3=A9ric Recoules <frederic.recoules@orange.fr>=
=20

Now I applied all five patches.=20
Thanks!=20

Takashi=20
