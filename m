Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7466BFEA
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 18:52:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1040B16D1;
	Wed, 17 Jul 2019 18:51:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1040B16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563382366;
	bh=Rtjoxie06M4wyZs/mE1uZTuqdUbSA1cgL68NIZP7ZHA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jiVyROqz05obJkEc4RMtVIBMJMs/PAejx4W44Km5S4uo/AG7trGw4jHXWchjYeq0B
	 PqlEHWosSxotVjGTIKJ4kinjMd/eE8T2HrLjrWdJpAQSVgk6M6f3tb52244InR+YtY
	 d/9JwJFAWoiCOwE3OIYEz4sT9swf0KIUHuHXB9rA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 474ABF80445;
	Wed, 17 Jul 2019 18:50:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30466F8036B; Wed, 17 Jul 2019 18:50:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF382F80363
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 18:50:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF382F80363
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="V38Ojkmx"
Received: by mail-lf1-x12b.google.com with SMTP id q26so17037331lfc.3
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 09:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wNAXEfmmabkDqnE/Fk/8mS9Vl1MA/WibJg8QIkwtN7A=;
 b=V38Ojkmxy8ffF/ZvBefbuc8hq37BA7KyDFHi0jL11iWRUAAMPX8Ghao9zSC/X7qsb/
 DGCrw1iMx9WTCA1TfZUhUqwPe6NQSwUbESwrtsfUigLoP33R5aQCKgyVB8dKsJ4+xq9s
 +oL7Fg7w17YPfRIzjkSBRhMy7JD1qATIr4L4mhWOSkY5ODU2QU5TocCN8GbWJtf8ZtIl
 yxYqVcuKdtiFZmmTT0SyjucLEdhT0yTdVyCujqSLSd9GTRStNu8KQgrobjC5YokCZJBj
 TUw9uo2RN+kgzoyGYaOHo1XKWp6lo+xdf8SCstUpI673KkP9SPp+r0dRrlmYESjAW4Ud
 1ABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wNAXEfmmabkDqnE/Fk/8mS9Vl1MA/WibJg8QIkwtN7A=;
 b=Wp4JKyMECxdlT0hh1/zOltHJCyX4D5fX/XebyH3IhPB0th1q8iZluzzDm/8YoG/7do
 wRB02QRJdqRG2dawYiuwOe2Cpq/69CAySPIpTSfeuNvQM+JJJLx3G1vFLoyQYulUC4iQ
 cpend5JALigz+1BV4Kn1hWEJug8ZTU8dCsDlRvAsoEIHVdeVTTq9Pzx1of3FwqM9SA3F
 oFbX1Mzi5tb9Ew/ujmIdfIspZDuZmZ9LyL9Agd01GYaGeh4Ko/+rjZl9v57HBkzp7E9S
 RZ7IKo+7I8YQuF+0534wug6d5ei/OjVKGS7BrzwlXwdfovs+y/6BjGN/lq4Wnz8mV6Pq
 tyKg==
X-Gm-Message-State: APjAAAVUwupPp4AUrxUy9R7Ex8tKBbSy8HZKXdYC5LqXyhAj7WwPQCyK
 ml059TojPlgFvF398u22W+tcZY+IrRKMaE4UUt0=
X-Google-Smtp-Source: APXvYqwehLVFid82yMKj2mL9bSbFAxO2VNayn/RZivwipwvShdidziMWPYRoLWtd4JixmgXj/1mgQyy5AS+oHjq+vDQ=
X-Received: by 2002:a19:cbd3:: with SMTP id
 b202mr18741578lfg.185.1563382213570; 
 Wed, 17 Jul 2019 09:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190717163014.429-1-oleksandr.suvorov@toradex.com>
 <20190717163014.429-7-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190717163014.429-7-oleksandr.suvorov@toradex.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 17 Jul 2019 13:50:02 -0300
Message-ID: <CAOMZO5Bqf-mWxsvgVYg1+xk=hvGRNocfhRH1F39HBD7q_UY2uw@mail.gmail.com>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v4 6/6] ASoC: sgtl5000: Fix charge pump
	source assignment
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jul 17, 2019 at 1:30 PM Oleksandr Suvorov
<oleksandr.suvorov@toradex.com> wrote:
>
> If VDDA != VDDIO and any of them is greater than 3.1V, charge pump
> source can be assigned automatically [1].
>
> [1] https://www.nxp.com/docs/en/data-sheet/SGTL5000.pdf
>
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Reviewed-by: Igor Opaniuk <igor.opaniuk@toradex.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
