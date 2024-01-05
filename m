Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0270824F93
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jan 2024 09:16:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE92BE9C;
	Fri,  5 Jan 2024 09:16:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE92BE9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704442591;
	bh=qNNS5fSGEoAt87woNZnPhgZJF3NgK1x4tMQaa7yQJdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CWUfaLINbAHoE9FK9DM9XVbMPWIgzSoyQP4bmoCx9UoNcD4jbcHSxUr7REnGlCN5e
	 gL8RtmP7r3zbT9gssYIJQsJ6TP+xdZ3YZzueWjDSlNopKbjPEbxsOGx173i59hN2nn
	 KCcWs905sdb6HTP7JD3QnR4eFXNPlsbo4nBbCkkg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C5EAF80589; Fri,  5 Jan 2024 09:15:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D2F8F8057F;
	Fri,  5 Jan 2024 09:15:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C322F804B0; Fri,  5 Jan 2024 09:11:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D13B1F80238
	for <alsa-devel@alsa-project.org>; Fri,  5 Jan 2024 09:11:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D13B1F80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aot4YTZm
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a28f66dc7ffso61461266b.0
        for <alsa-devel@alsa-project.org>;
 Fri, 05 Jan 2024 00:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704442292; x=1705047092;
 darn=alsa-project.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDc3X/vTCrv9i8PxCPyqlLpcrg6iDYAL/aeEr+2xMyc=;
        b=aot4YTZmGlVTSVt4xLPgi1Aoignq/c0KTacrWeG8sieX97Am6kn3X8ENwhC0QswZ3Y
         a0146u7O8VajMz5DK2awOmvm4f08lZ+zXNXZvefkgc6BcAbnp9lQMN2mGsIepmmY+2LE
         uYS9vDlEkv0qUkUYtQXLQoKJYQgOGJT160LtOelnctSUpHV/N4vZpBktiFbxs+RB1WNs
         j6uxW8nZrzjGVFMkCZMpOtDhh0qLEtON2IBnQroOlhiXQwNwP/2/g8qFzpcepSpxyUUo
         ENt1qW0zJ8Vs30gPTGeIjzv2sSDE8koseIGNqVdMceDr2kyMX0zGa7ZOV2QLhoRqi9x2
         H/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704442292; x=1705047092;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDc3X/vTCrv9i8PxCPyqlLpcrg6iDYAL/aeEr+2xMyc=;
        b=kGbKK4evpbmqLE7SHfM7slyzY88r8TVoO5h7j+c2I7+c3YXDCOvfQ2XTEeN05JIfjq
         jKVn+6/VpEbxHS00JhVCJ4/o4tUcom3rKa195i693cdh4S1GCsndNtDbhXICtScJlDD3
         VHiEedPQ37qp+cDrIeyCy9QGbTEvBFtDQoL5D8BD+WO+bkZhycLJzrtT1+mFxQBoYqNY
         VS3nRMkXK0bpzLvPraizogNV1H6EKjcf1MMVqVKPwofG4pQrcFzWzCntul5xWW1L4ZhE
         l1KiZIiEm+/tca5jwwRL5x2dNnlysH+5TZU//raatuxh7J9fgFfPVuM23vVWXT2LGvxl
         fS7w==
X-Gm-Message-State: AOJu0YzOKwgPacMgUJxmCfT3vi5tZL+MI7DGjX+i2ljvLXxYl5DR6g3q
	Gt5E70ebvB/gt9VJY9xQfQE=
X-Google-Smtp-Source: 
 AGHT+IEtSoG6+TQ5lp2vD5o78oLq7FNxPf6otoqjX5IdT3AGC6plY2CLaP4BqbV0ImHtO+r+DFIGtA==
X-Received: by 2002:a17:906:34d7:b0:a23:671c:2284 with SMTP id
 h23-20020a17090634d700b00a23671c2284mr1666245ejb.29.1704442291971;
        Fri, 05 Jan 2024 00:11:31 -0800 (PST)
Received: from orome.fritz.box
 (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id
 r17-20020a170906551100b00a2356a7eafasm420985ejp.199.2024.01.05.00.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 00:11:30 -0800 (PST)
Date: Fri, 5 Jan 2024 09:11:29 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Sameer Pujar <spujar@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	devicetree@vger.kernel.org, robh+dt@kernel.org,
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: Query on audio-graph-card DT binding
Message-ID: <ZZe5sTNz005Tt4jk@orome.fritz.box>
References: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
 <ZZblyhfzQjzyoUc_@orome.fritz.box>
 <42c0c4fa-585e-4194-bbe4-e0377c87e632@sirena.org.uk>
 <3faec2e9-8cd9-46f9-8807-801922de0edf@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eGTPasXYebqI3XK+"
Content-Disposition: inline
In-Reply-To: <3faec2e9-8cd9-46f9-8807-801922de0edf@nvidia.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
Message-ID-Hash: MOWVYDRMEFFCUWQANYLA7KXECAZ5UZWZ
X-Message-ID-Hash: MOWVYDRMEFFCUWQANYLA7KXECAZ5UZWZ
X-MailFrom: thierry.reding@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOWVYDRMEFFCUWQANYLA7KXECAZ5UZWZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--eGTPasXYebqI3XK+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 05, 2024 at 10:24:18AM +0530, Sameer Pujar wrote:
>=20
>=20
> On 04-01-2024 22:52, Mark Brown wrote:
> > On Thu, Jan 04, 2024 at 06:07:22PM +0100, Thierry Reding wrote:
> > > On Tue, Dec 26, 2023 at 09:58:02PM +0530, Sameer Pujar wrote:
> > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /-----> codec1 endpoint
> > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /
> > > > CPU endpoint \
> > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \-----> codec2 endpoint
> > > Can you describe the use-case? Is there a need to switch between code=
c1
> > > and codec2 endpoints or do they receive the same data in parallel all
> > > the time?
> > > Could this perhaps be described by adding multiple CPU ports with one
> > > endpoint each?
> > Don't know about the specific use case that Sameer is looking at but to
> > me this looks like a surround sound setup where multiple stereo (or
> > mono) DACs are wired in parallel, either with a TDM setup or with
> > multiple data lines.  There's multiple CODECs all taking input from a
> > single host controller.
>=20
> Yes, it is a TDM use case where the same clock and data line is shared wi=
th
> multiple CODECs. Each CODEC is expected to pickup data based on the allot=
ted
> TDM slot.
>=20
> It is possible to create multiple CPU dummy endpoints and use these in DT
> binding for each CODEC. I am not sure if this is the best way right now.
> There are few things to note here with dummy endpoints. First, it leads to
> bit of duplication of endpoint DAIs and DAI links for these. Please note
> that host controller pins are actually shared with external CODECs. So
> shouldn't DT provide a way to represent this connection? Second, ASoC
> provides a way to represent multiple CODECs on a single DAI link in the
> driver and my concern is to understand if present binding can be extended=
 to
> represent this scenario. Third, one of the user wanted to connect 6 CODECs
> and that is the maximum request I have seen so far. I can expose addition=
al
> dummy CPU DAIs keeping this maximum request in mind, but not sure if users
> would like to extend it further. The concern I have is, how can we make t=
his
> easily extendible and simpler to use?
>=20
> With custom DT bindings it may be simpler to resolve this, but Tegra audio
> presently relies on standard graph remote-endpoints binding. So I guess
> diverging from this may not be preferable?

This seems like a legitimate use-case for the graph bindings, but
perhaps one that nobody has run into yet. It might be worth looking into
extending the bindings to account for this.

I think there are two pieces for this. On one hand we have the DTC that
complains, which I think is what you were seeing. It's a bit tricky to
update because it checks for bidirectionality of the endpoints, which is
trivial to do with 1:1 but more complicated with 1:N relationships. I've
done some prototyping but not sure if my test DT is exactly what you
need. Can you send a snippet of what your DT looks like to test the DTC
changes against?

The other part is the DT schema which currently restricts the
remote-endpoint property to be a single phandle. We would want
phandle-array in this case with an updated description. Something like
this:

--- >8 ---
diff --git a/dtschema/schemas/graph.yaml b/dtschema/schemas/graph.yaml
index bca450514640..1459b88b9b77 100644
--- a/dtschema/schemas/graph.yaml
+++ b/dtschema/schemas/graph.yaml
@@ -42,8 +42,9 @@ $defs:
=20
       remote-endpoint:
         description: |
-          phandle to an 'endpoint' subnode of a remote device node.
-        $ref: /schemas/types.yaml#/definitions/phandle
+          A list of phandles to 'endpoint' subnodes of one or more remote
+          device node.
+        $ref: /schemas/types.yaml#/definitions/phandle-array
=20
   port-base:
     type: object
--- >8 ---

Thierry

--eGTPasXYebqI3XK+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmWXua4ACgkQ3SOs138+
s6Fx3Q//e7NFejG5s5nQFCW5feme6nEY++g6ZhvBaKWOn/i6PaC3cMLq+WB4tOXQ
l3x8Spxx/zbbfqMsd9ZbNWp2ayrPjpM3x0NOgdVEDkaX/mQOWskZbjI94rTOqV2O
qeUoeHivqjmidvel+cjFYMpmCRNGQDv3NQUvHdREbRB9OQu63RyIAiVousP1Y35y
meXii3XRc0dmp5o4fpb7eQcI0wYAQmJpNhGYSUepqSz5sKvHiBEJszz5Wy5u7ncu
uM5zdNlTRJGaWH20Tx1YfI5kI6XDvoVRGv9AfRTpZ6vLJplAWB0X1yOWzHNH/F/E
STMru2d/eq1MHss1aHk7w9l/vR0I6xbyaCjZv2N4xFjxxePMTybzAePDcYNDBFVq
7DSjCN4q0q715jBiSiFBsXTGJs2D8Ni8PstNdHBcM7QNP1gf22erSiqtvNADTo1v
wPd5iv0iRiCsiQcI5lJTAH+Ac5hte8Y+O9onaFtdIy8inhZP/5mpyZdrlIHotQef
oDQ9zXuSYCYqLNytrId+3QzvbaiV4A2v3l+WLMVDhym2fZ4zVnh3Lct7oG3GYfrG
VvSxeBX8+0C9ktrYWLYxoNf9KxuJ4pMxLtur79GXF/LxTAzkY0V2znfk0eWyBNtO
66Hx+c26rIiJOC7+lIAVn39TFH+iGAfH6e64ydz6thKdToeDhto=
=b9dE
-----END PGP SIGNATURE-----

--eGTPasXYebqI3XK+--
