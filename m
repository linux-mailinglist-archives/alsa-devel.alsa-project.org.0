Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4931B4B4D8F
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 12:14:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D00C516CD;
	Mon, 14 Feb 2022 12:13:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D00C516CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644837269;
	bh=5C0jDwLjeWdBKh+erj4juGHFbMW0V1JwjF7sujE935Q=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MtvyDCmtc5Sv2Ph9pPlIhd2k8owq2nteTEBiSzTZl3T6eKAyhVF1HFIthNMVd3BxZ
	 W2emou0+RwgRMGtoJYSLdYHtuAp6UMRl9C9a8SB1uHiulvo/gewT8FZjoqYladg4/w
	 yR0u6PRPvNu2qv5YTd9+Zrn2v2kR284wnOSBKcsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27D3DF80430;
	Mon, 14 Feb 2022 12:13:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2A0AF80310; Mon, 14 Feb 2022 12:13:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77A05F800C0
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 12:13:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77A05F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bpp/enIT"
Received: by mail-ej1-x633.google.com with SMTP id p14so12397858ejf.11
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 03:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=5C0jDwLjeWdBKh+erj4juGHFbMW0V1JwjF7sujE935Q=;
 b=bpp/enITHK82B7qPF79spkRhdzHyfPNmavLzrKHjvxuyqLrMjgrf7arGdfJ7vAUI9m
 Qoe9krAXOxIPt+U/qHR4utNwoil5Q0zir+pIasfdUpRumCWvJsyhgjNn11p/BCcUaeAN
 vVRfFiDelYXCHie9uLXmDWJSqoel0PKMkFhMn34niAsszFJNIzpre37YQhQs1835IVbt
 pbsQkNEFsibRsjcJgSzIqrZYMvoXjkHsrjUraCXlxmThAmyh3s7v6mZnO00YyXVBcUkv
 HhEPYq4WHHbVCCktrGIEOG9rtYV66IV1Obz+v660Ab3aif1WLa6k12Fbnr6kyLIbNE9V
 nzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=5C0jDwLjeWdBKh+erj4juGHFbMW0V1JwjF7sujE935Q=;
 b=PYBm2OMrTFXWX7wcAouIZF0HFRI/l73mtHQdZhvUNNxo6QFpqnaJ/KC/Fw0Lteqrko
 gQzUSqpsIaZ+q+RmYc3hyecSKJVD6pmPxGEmkDokSNDOfIvxa7yA2aMZM+h5/TuOZT1Z
 PsSZpPf+jCkJUYUOzZJqC+qqOXWG676g44dM02cFxLw7kFnEmpQzSgS7ZRz+QP9o434u
 SjKRJ8xBK4M9QASqQthT3SmoRBOMc5UKEsypPwQwbOes+sjH1o/rvIGEsOnF8Z5ars3K
 2ksECUXFyj2G0VLrwxNXSxOSsHm+9SpWEGpEVotJpYwaH8HxP+jukZkEMUSIVVwy0NqZ
 A4MA==
X-Gm-Message-State: AOAM533PC0mBEYnitA1TvRvdTGu5zGCznr0Uf0qTENG8dZJO5TQ9MgFf
 5d+0h9fu3iIvw6LdcTasntiS/IqT9uQppTCxfs8=
X-Google-Smtp-Source: ABdhPJwdqPeDNFsyHSoB/0/9jZLjMbltDkx50RJO4/qpf5EiaSIPSm+yAEzFiZO2hglTeaHUcYHY2vp9J2v5jDHGRL4=
X-Received: by 2002:a17:907:c26:: with SMTP id
 ga38mr10955572ejc.626.1644837193581; 
 Mon, 14 Feb 2022 03:13:13 -0800 (PST)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 14 Feb 2022 08:13:02 -0300
Message-ID: <CAOMZO5C9qqxLMA4Nw=YKvZth4_G-rMxCkOLOQ3a80nK8WWDURQ@mail.gmail.com>
Subject: cs4265: failed to add widget SPDIF dapm kcontrol
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

Hi Charles,

I have a custom board with a cs4265 codec and the audio plays fine.

During boot, the following error messages are seen:

asoc-simple-card sound: control 2:0:0:SPDIF Switch:0 is already present
cs4265 1-004f: ASoC: failed to add widget SPDIF dapm kcontrol SPDIF Switch: -16

SPDIF is not used on this board.

Would you have any recommendations for getting rid of such error messages?

Thanks,

Fabio Estevam
