Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 807AB606033
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 14:30:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CBB8B950;
	Thu, 20 Oct 2022 14:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CBB8B950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666269029;
	bh=GbdJ4Peu/E38/32Na4oJOo5P/t/pYNcwFTsRn1CFdQY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RTE4tLqL2WmFJQ0BaWs8aIzm0bAYU64MrVGeS4yh0XRSXJqtOmUlAjAyKUkphwEZh
	 9r5FljjH+a74mrcqvg/OCOfWwwCAYRBz8H4o7AuybQh4PC+tw7ubUBfY7g6baqrc5S
	 B2e1pcDKebY5zQ17KHkb4WUy9u42Nq2h+VVajasQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9850AF800EC;
	Thu, 20 Oct 2022 14:29:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B83AF804D8; Thu, 20 Oct 2022 14:29:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C06BF800EC
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 14:29:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C06BF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TyhPJkyG"
Received: by mail-io1-xd2f.google.com with SMTP id p16so17006641iod.6
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 05:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GbdJ4Peu/E38/32Na4oJOo5P/t/pYNcwFTsRn1CFdQY=;
 b=TyhPJkyGmsgHkM6VTj5ZF6j/yBnW3wKzbb0eo7yGqS0KzjHLVm2YIfK5GMHosvmg+S
 pHcCwADi6/GMWThazL155mg1YKNl9SfWT6vLAk/AGe6GOheDvUKo8rWFyHUtGEd3OJoV
 rw1K7JPKE0ru5dqMI7ogq8TCp/Vm4m5GySiZpe/sWDWBCW15VDfs2e6X9s+SK2c+EfP4
 JcmCJNGuK8ZkcHum3yhlyJvzy8GHjNoS6YBj1rA6ecDI7hkix3dM3QB+k5ni72UNLfxl
 Ex6DUmn9Y8SJzZYHCxPD74tvHHdepIHEB3OmJ7AilbLhtvlFiKeCBn+BDXSH7t3iahC5
 cq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GbdJ4Peu/E38/32Na4oJOo5P/t/pYNcwFTsRn1CFdQY=;
 b=rmPvpk++prRyuYBUtDzIvdxHVrGF1HF9TLwHzQZ54UFqj0x+MGAF5jnU2gCOstNoO5
 o9DhGhPj8KhbM+UZgJJ4faBOAyeAKqzZCZwMvVhobWfewJv6dGEty0BA/HB6WOPeuXgr
 KWA+tFNjMssubYjw72uq7vaJSBZAweHgEtHMswysrbYctCvEaev8xIeodV8AAyQeo1n5
 +lhCfmBuVKzJ9qFyDglTyBATnBRNrgblGgwFTpFIzMiaRvfdLQioEWem2Sj9457gz6fV
 ED0TIy1283JNecldoLIS7/XmTU+dJyfEclNkaDqLCMzMDGQNJlV9/yd8vHK0e6J9jDK2
 KMDQ==
X-Gm-Message-State: ACrzQf0u1kQBHKrzP+5jBRrynOgiHDt8jUHFSabOpgTWCLbOAh0hgzgE
 JfRa4qaivFRUcytVNaCCyGy53udlWW7z5GFf6rI=
X-Google-Smtp-Source: AMsMyM44PndMIt9F+Oo2TK6GgTPokgUODgaLemVzy82ml3MDdlkJTgd+6KE13KqICkXNxlX84EXS3TEoamZZnZbjabI=
X-Received: by 2002:a6b:ba41:0:b0:6bd:1970:16ac with SMTP id
 k62-20020a6bba41000000b006bd197016acmr1886486iof.15.1666268966631; Thu, 20
 Oct 2022 05:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221016132648.3011729-1-lis8215@gmail.com>
 <166609251307.155136.11548088283059583394.b4-ty@kernel.org>
 <CAKNVLfbfRRE3O2uFH6MQxoa_cdqTUcvpGzmcxFm3oCLKFfHv6w@mail.gmail.com>
 <Y1E7nFC9DcdqegKX@sirena.org.uk>
In-Reply-To: <Y1E7nFC9DcdqegKX@sirena.org.uk>
From: Siarhei Volkau <lis8215@gmail.com>
Date: Thu, 20 Oct 2022 15:29:15 +0300
Message-ID: <CAKNVLfYc8FP6g1+nFAwEVizFg1dDtU-Qj79ZX3-_P1=y0XSKQA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] ASoC: codecs: jz4725b: Various improvements and
 fixes
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
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

=D1=87=D1=82, 20 =D0=BE=D0=BA=D1=82. 2022 =D0=B3. =D0=B2 15:14, Mark Brown =
<broonie@kernel.org>:
> This was already fixed by Colin...

Wow! Thank you all, guys!
