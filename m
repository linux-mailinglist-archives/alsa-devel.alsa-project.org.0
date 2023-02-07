Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E00A68D54A
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Feb 2023 12:17:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5FC51EC;
	Tue,  7 Feb 2023 12:16:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5FC51EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675768647;
	bh=etY0/5Cy5OAM96hnKpBnFOOWxF+pCw++PRPyw5AllxU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QqXEZsQaWBiMm0jo4NuD777QdmHCr7x12LFDv9+rQ9LiZ+RDsQ/q3pXYOH5icAwnl
	 9Lbn/BgIzd8dtseuyWaB4stvX90r932wLSRdRvjoGIr+1QhPXJ/t5uFbTkBFoP/xYi
	 AZ3wAz7CCEMBa2fLqdDUuWYEaQJ7qj0UAGPlZNvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15FD8F8045D;
	Tue,  7 Feb 2023 12:16:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C76F3F8045D; Tue,  7 Feb 2023 12:16:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D40CF800E3
 for <alsa-devel@alsa-project.org>; Tue,  7 Feb 2023 12:16:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D40CF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PptnMabz
Received: by mail-pf1-x430.google.com with SMTP id 194so70014pfy.4
 for <alsa-devel@alsa-project.org>; Tue, 07 Feb 2023 03:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=etY0/5Cy5OAM96hnKpBnFOOWxF+pCw++PRPyw5AllxU=;
 b=PptnMabzoGyydtjb/qQdLmF1Kp9KPvsq5XIRWEj1BgRHyGW71E5i1f+YeK49ClxIQG
 dVJPErOt2EaCRuHgWo9NAAF5c6VCB+5jyPy54HDt40TQ/xPS7vex4nGg8tmfcYVjDeza
 DxifxNvWQDKgbMfLwGXMjC8fn9ky/70wBKhaSuowZxlyeMUNRcskf+WVcJS1dZ9XJ8MT
 //c7kOCo/Id/shwKaVKFEPFFKPlFMCLNcpkYjhkZ0eHKmVfsLCnRdHFeMIfntDoZJnsq
 KhRV8DakSG7psbEk7ryu7eTU+7pjhRvnhBazjSMjeL/bc2uO1ieHGPgfgiR2utqFGnBv
 R0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=etY0/5Cy5OAM96hnKpBnFOOWxF+pCw++PRPyw5AllxU=;
 b=5RbXNrwG13i+TNvNT3lEYKK/OofEYUedEwx/Ini8fq0zF6QyrjOtI81/XbrTkO1kNv
 R1dlJZzz0mDf+aca/1KrYXrnNILhROElNAmdxSC/uFcxb71x+YmN9EQVyn0yJp994vAy
 rMXwa2yHOoJfVO94C1rcNMuYCtUF2kofeLEMsZ8EzzrTtrhel1iQRKLEWPEXHhS1mMTj
 8pQqJU9KADpeBFEyObK2EhoDl3IHVwjF6JRFz/anr4+YEKn2zboqCUxLfURyH/4z+RiI
 pUjaEWU/tV6unsCZnUSnlJobp0WRxEzspk0jNnVxm+k9KIHw4JedIiREL65VX4fxfkpM
 YpKg==
X-Gm-Message-State: AO0yUKUSXJmK570fYPxjnEl5/O5bQFF3ohlu4+AAm8C755KvIf5EgELL
 f1N7oOdrUtPO1KMlll/2M/9ZgvrEXtFKo6A42YU=
X-Google-Smtp-Source: AK7set8cE9lJ0YZsm+aEvy6PWbH+nD9yXsYoy4tI4gSz6pbRzABiojgVlboPR+QUs0q9HrZ3Z2pjlcfMBVkWiBodsBc=
X-Received: by 2002:aa7:9496:0:b0:5a7:22e3:7bb with SMTP id
 z22-20020aa79496000000b005a722e307bbmr572013pfk.24.1675768579645; Tue, 07 Feb
 2023 03:16:19 -0800 (PST)
MIME-Version: 1.0
References: <1675760664-25193-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1675760664-25193-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 7 Feb 2023 08:16:08 -0300
Message-ID: <CAOMZO5Cs_ON6wJHGo4Gskc9sNThKW4bXC_jfMwxkkLkN5syo_A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: fix getting version from VERID
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, broonie@kernel.org, shengjiu.wang@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Feb 7, 2023 at 6:30 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> The version information is at the bit31 ~ bit16 in the VERID
> register, so need to right shift 16bit to get it, otherwise
> the result of comparison "sai->verid.version >= 0x0301" is
> wrong.
>
> Fixes: 99c1e74f25d4 ("ASoC: fsl_sai: store full version instead of major/minor")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
