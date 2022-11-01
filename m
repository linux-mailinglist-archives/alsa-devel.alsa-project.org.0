Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B694614296
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 02:05:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0DFB1640;
	Tue,  1 Nov 2022 02:04:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0DFB1640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667264748;
	bh=Co31BusoGSY0MXuFeKA0QlCszA6tiMpIiw8hHEzMy28=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JK3RlW+GoP9UYsCxAnAgsPhS81QbpHzKxPoRAS4tC/qzKsbiE0v36Wes8orwiFxIQ
	 kET3U33U6I/HiJwXTcglLkdbEcLRNPWTLuqdAUdFd8Raw60lHTEGA+y5oSiZJsUdSM
	 ZNWzLpAlfLSAC4TxicPy6RiIQm9ZawRl1RpUcJGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B583F800F3;
	Tue,  1 Nov 2022 02:04:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D92BF80163; Tue,  1 Nov 2022 02:04:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A8B7F800F3
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 02:04:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A8B7F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="fFKYIUFX"
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-36cbcda2157so123389007b3.11
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 18:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Co31BusoGSY0MXuFeKA0QlCszA6tiMpIiw8hHEzMy28=;
 b=fFKYIUFXKtITwrPLqasMLB1EHzFCV1ahYkQ3s3TQmt2L/uccTfNAITexpynI2emGWQ
 L0efnOz06fdQ8AYkBw3yutXLfnrZD9pX+EAy71QXcnxzg7zwGB+ot793T+iJLK35xwJx
 3W+An4ChtjB6RS4TU/6nHfnIFyL+gUS3fqyy2Zzk/i4gUr40thWNi6GOryi4XGk0Rf7b
 29bnWmE+gT7Juq6qz4fkfjRrKCp/vVqxloUhoUJP73sHMYVQzYtCBWfS2hcW5sx+Qu+m
 55rOvBGn27AKXrhd7SPCjeIbnYet7rzcBRdHPq0gknY9a6e2XiYOx3jqaiZMLzJcQq3W
 0VfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Co31BusoGSY0MXuFeKA0QlCszA6tiMpIiw8hHEzMy28=;
 b=kQ263TeYk3upUrT6S2SrN6SL8WF9MnLCEBOGn+CdoSkMyo5/3j+GDGQ3v9+M8JduRo
 nV+AXpoFBu8HFdrIwQfngS+xvY70DMLNlMH+cernlrQQ/7EMULYwlhlTlkW+3qSyIbL4
 QSA4sLulIw+x2PTkzuGt4tJ6AWU5+Hoy/glsbRtxbnDx7NAy93rSztbKo6PC908cFV7K
 7DivlivuhEZjSXbXNz7rbtkqz6VxVozMhe+YA3avKfYphOJhWKs6ezc7XWnElVmCjtbY
 wf0/T1rNZCIxpSNDCKLOsmdnFzpoQRkfYFrVbTZsvcy/FI4IiOBbmIwGsDn5KTZf9Mge
 gNZw==
X-Gm-Message-State: ACrzQf1wsMKX4IgHa4bb3mc3xs2QL756rucvORCIdSQlD1FtCMqQA9BI
 Y2BDXuQoxGAbfGvpWz2l5Tw9gJf5lhozJFT/i06BwA==
X-Google-Smtp-Source: AMsMyM5AqSG/s/7RS5sYTrot30XqWHEK/nyNuZSJdwa4sk5v4Ezc4sUV0G3a3sCElW41Ozxyxt5F67HvM8x9vV+w5A8=
X-Received: by 2002:a81:ab4f:0:b0:36f:d141:f9af with SMTP id
 d15-20020a81ab4f000000b0036fd141f9afmr15526798ywk.311.1667264687461; Mon, 31
 Oct 2022 18:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221028102450.1161382-1-ajye_huang@compal.corp-partner.google.com>
 <20221028102450.1161382-2-ajye_huang@compal.corp-partner.google.com>
 <Y1vDYNOwZNOco1hq@sirena.org.uk> <20221031184343.GA3235956-robh@kernel.org>
 <Y2A0fdwnHTqw/NDw@sirena.org.uk>
In-Reply-To: <Y2A0fdwnHTqw/NDw@sirena.org.uk>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Tue, 1 Nov 2022 09:04:37 +0800
Message-ID: <CALprXBYEsB5z-iioBeyeBAwPFkOnkQn8CBbj9Di9CpdqvFFnOg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: Document dmic_sel-gpios
 optional prop for two DMICs case
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, devicetree@vger.kernel.org,
 angelogioacchino.delregno@collabora.corp-partner.google.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
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

Hi Mark, Rob

To avoid confusion, I had submitted another one for process
