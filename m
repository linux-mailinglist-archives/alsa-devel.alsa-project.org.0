Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A48152284D8
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 18:07:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BBFF1661;
	Tue, 21 Jul 2020 18:06:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BBFF1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595347636;
	bh=vsOC52EtYKYdtdKjaZr3lSvweHM+fmWaHAmP/fVKg9U=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=og2oiBKNxQfmryK05Yw+gqHu4Ce6kuqaLvF5P1s9RfcoxtpYXHqsqQehbYOsvL4xK
	 ybmUXoA1rF+8/fyC8Ug4MVZkyWeNe0IzIFT2JpQiMqRWdmV1Rhuelfqk3+6yadFiNZ
	 MnmsUc22KdM/j23K793tfNLfCgEeI77fIZ/0TY1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38D5EF80212;
	Tue, 21 Jul 2020 18:05:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 024FFF8024A; Tue, 21 Jul 2020 18:05:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7A93F80117
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 18:05:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7A93F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FNDiRMlB"
Received: by mail-wr1-x42d.google.com with SMTP id b6so21722480wrs.11
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 09:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=vsOC52EtYKYdtdKjaZr3lSvweHM+fmWaHAmP/fVKg9U=;
 b=FNDiRMlB2dbrjLSAKN+dsaUENuxSf0waaE52j8S0Q6SeeXiJarT3m2HyE8Yv5oGUcn
 f9SXttWXpZafx3KUTjqTT9rCdGof7a5AwQA+pOZCrm9ywxrHRRxlpaISXssK/F13A/ua
 fcwgEg66waBMRj15dqNNBqOh0TIs8HQQljhk5GA83wToyKuw5prI5Rl+uMBgR6jmeZoB
 RSNCsPhum5Snw1DwdPpWpaJuRpD2MhxMjzkcxG0zQLJ1/DgSkDgE8eqxNsuejfiTa/sJ
 OvbTxXT5hmL97j/YQAfYZozA91ek86VcC6Ud4vlAluBaoD0gbRL8zIjs80bSXxLnH6rj
 X9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=vsOC52EtYKYdtdKjaZr3lSvweHM+fmWaHAmP/fVKg9U=;
 b=LLXw+c1CA86ur560l2UrbZQIP4Il7BqsAQ3vFH5+9NM+nIQTgYldOAsboljjf13s/5
 NZ11UujqbdeTySYVJLdVMAD103xC1zVFNUzJGk9raIyf7FL9T5rzxKlXXPKp6Q+WYdKR
 sBIrSD38P5QfeJHbJ7vwHIFJQxi3TiWBIzwjkAHBCrus+8utpp8hYuerCoWdqGllr31M
 yx7w7qO6TkR7JjBzAlGIeACCLqTCnPwU5sJPc5Md1zS640pgbzI7xy/IdjdQCKYrWarg
 uEfsPyKquhNHGl95pi6GSxkNfprJ/PrVYxGKnc5WhzYGNNwbWHdWzXHniXG4mlzPJI0M
 QjTA==
X-Gm-Message-State: AOAM53211HCoNveeT/xfNNLhQ80NC6YjuYUqrVAejpvpOzTmQvnFGcuu
 EihP2idmgZ95jJGVh4/+ETUpgBjUax7eq+HgSxE=
X-Google-Smtp-Source: ABdhPJyij+FLuTEYlaWP6zHsR4LoI6OVyhCGrLDIncIigM7NyrP6Autinxx8sitcQI/xwTU/bEzTV3Prt54QJU2cllo=
X-Received: by 2002:adf:bd88:: with SMTP id l8mr22358996wrh.204.1595347524384; 
 Tue, 21 Jul 2020 09:05:24 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 21 Jul 2020 19:05:13 +0300
Message-ID: <CAEnQRZC4FNrLSbasRH4Au=W_tHyQUV_y0WOn-RDZboEhnf0e+g@mail.gmail.com>
Subject: snd_soc_component_driver substream ops
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

Hi Morimoto-san,

Looking at snd_soc_component_driver I see there
are some operations like: open, close, hw_params, hw_free. (1)

Now, snd_soc_component_driver has snd_compress_ops.

Do you think it is worth it to group operations from (1) in a similar structure
maybe snd_<xyz>_ops.

Daniel.
