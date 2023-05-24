Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1094470FBB0
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 18:30:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFA4F1E7;
	Wed, 24 May 2023 18:29:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFA4F1E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684945804;
	bh=iyKrp7I82f3wYzsbQR/1Jeu1cFgJoa6hSbBVeuarAhw=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SXV4JTJAV7OvMNdCaYf6CjBDWaElt4hNMfij1hSWOrEmhMwtDzkqY+vXWWg1vLdAG
	 8DvwPZ0XHw7Z/QgLASMNh+QL/iWEQLZ/m35qiW2KaclfO8HjE/6AIQ3qO9OSkRuG0f
	 9VrRpe2rud23CFopmZpOXKTqsHC3132T5R5LheS4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E4BBF805BD; Wed, 24 May 2023 17:50:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B73E6F805B3;
	Wed, 24 May 2023 17:50:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8276F805B6; Wed, 24 May 2023 17:50:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,EMPTY_MESSAGE,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29526F8057A
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 17:50:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29526F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=rJ/SaWyw
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2af305114d4so2343811fa.0
        for <alsa-devel@alsa-project.org>;
 Wed, 24 May 2023 08:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684943427; x=1687535427;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wQX2CVmSr7DgptZsjqZI/naPAO/w0sxY4PIlV5EtZyE=;
        b=rJ/SaWywkypPgDXARIDn7Grh1q/ZQeNb9pV3HTZiLeDd0W98DATkQKurgeXicTL0Wh
         GtZlZnNexxJJygfcciig7fg/kDS6yGuMimO+64xke0bU/xI3CctxwSIPZcZ8vV21KwVP
         3J/HGM/8dfmPPmW4yeRwaTc+Hp9WzVaX+ySCEwvH97dZLId88zb7MEujqwvx7i1t1xO7
         srkIHk+tZYmVZHn8eVblOrB2JaBAw2BOGPfGHw0hDBM78xNKimhDGg9gIAQZaIQ6rN1B
         wxgjcIhqb9xfDRK5ZeTrHrFa6LVqcEtewBg27iERNkRr+NBoFHSbLzHPP2ADPsxLxuOn
         KURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684943427; x=1687535427;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wQX2CVmSr7DgptZsjqZI/naPAO/w0sxY4PIlV5EtZyE=;
        b=WHw/tEyw6LLQ6b/skiFfcTnuoL/t7p1upMpPsSrKnJM2l+iPoNuvbsacWJgaaYoVtf
         vBaOf82XHQegM+3lbdVeVbmiVcyZHbTI993i8cv61ft1+E3f0T2QBBksYa8kaYCwm/up
         UD4fCdCb4ZTycdPCskz0Ur3wansLNLfik7NomQRQWX1UVPgJEW7Mn5Mz9TE1WtNrg10m
         DaLa1zPjCbxYS+QzRZMZvxNjXIE75nHNx4EyWvoAZusVjRJcjjJ8szwNYIXhvDQ9+I6k
         Mn9i/wqlWWH5it8ltWK3ciJwulV4VS0lkkytV1ZnM+SfVbzB5Mj4tmd12GoCOBL06V7M
         dDvA==
X-Gm-Message-State: AC+VfDw12jjKRI8ghFkjzqgll1j+uEMsHm3acejQoA6f3516K/OHucD+
	AC6bzbi6PgbgmNRQtMl4jyTMvJlSCvlQvCnvpnasCVAm
X-Google-Smtp-Source: 
 ACHHUZ6pqLqFYZTwrt/9U3mhBqWyGabwDebjRvMF+vWNA2B7ZvjpP5VUyLjG9SxclpuvuZQb4WSGnl1VtTDLQUhqzEo=
X-Received: by 2002:a2e:8e29:0:b0:2b0:361f:80e1 with SMTP id
 r9-20020a2e8e29000000b002b0361f80e1mr1855520ljk.4.1684943426628; Wed, 24 May
 2023 08:50:26 -0700 (PDT)
MIME-Version: 1.0
From: Juan DCG <juandcg314@gmail.com>
Date: Wed, 24 May 2023 17:50:15 +0200
Message-ID: 
 <CABQt6FjF1gY-W7EsEww64-Y2ujNuf0iSC5ZigcSFtmzGhYu=Jg@mail.gmail.com>
Subject: unsuscribe
To: alsa-devel@alsa-project.org
Message-ID-Hash: PPLRFCXZ5ROJXVEU2EOM6SCCR4WET7PK
X-Message-ID-Hash: PPLRFCXZ5ROJXVEU2EOM6SCCR4WET7PK
X-MailFrom: juandcg314@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PPLRFCXZ5ROJXVEU2EOM6SCCR4WET7PK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQo=
