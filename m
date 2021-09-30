Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF6141DF1A
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 18:33:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C522D16B9;
	Thu, 30 Sep 2021 18:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C522D16B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633019580;
	bh=Lv0iP/T0ZDgpOkBqqcZglEBEY9q6N6aO+kd/TeOt3nc=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sxt4aitooCyJYAUnOF2z5JrtMzBK0zd1krSdbWLqzYm6XsKMCobIXOLNvWUiIUiSQ
	 6V6kRTraBobZ0BaMdADxFKxICAsaqp4qo9HFdLoW34VmUqS0+oXwLWT9IzQhuTEnlM
	 LXMC76DESPE7XnHvAvW0OyhiSmy9D7ex6kQD2D+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0CE9F804BC;
	Thu, 30 Sep 2021 18:31:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9FEAF804AD; Thu, 30 Sep 2021 18:31:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90B10F80113
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 18:31:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90B10F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=vt-edu.20210112.gappssmtp.com
 header.i=@vt-edu.20210112.gappssmtp.com header.b="6Gwwy3HR"
Received: by mail-qk1-x729.google.com with SMTP id b65so6357834qkc.13
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 09:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vt-edu.20210112.gappssmtp.com; s=20210112;
 h=sender:from:to:cc:subject:in-reply-to:references:mime-version
 :content-transfer-encoding:date:message-id;
 bh=cqHxdPB01WlLXP5I/cQYz8T29yjetk+tqLq1Q9a5iYM=;
 b=6Gwwy3HRR1vMGCy4uEZ6QL4UC4FrthKs13fbJUZeh8Ytik0HjuEC3gqH4VCut2+3ka
 3wJjt01UuCjMp4f1Ac5SxolS6ECpON5J85VO1XNLU7pEaeYY9fv9i3v9WpbXSMdfNUiK
 Dpb3rxmchq3bvlQfSEL3LBQT5lHdcrn5dNBwSGewNVc889gsyvia1/QuQuibWnmtaW/0
 mISIwYoxY+OEmkbBinQEsQboIJOIHSVu0ejJ1V/C4nPRRGHsfCJSihW1bcTa0n8yOoUj
 LI+TF/ZEqNU/m6szgKcsGK9uFIhMpCPYu1h7BRpWYGhTsH5N+UbkuIBzPXbt37uw+Nyw
 jaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :mime-version:content-transfer-encoding:date:message-id;
 bh=cqHxdPB01WlLXP5I/cQYz8T29yjetk+tqLq1Q9a5iYM=;
 b=ETBGlygYppHuQATMJli/4aHjtVcgAIVsxtR7uM57CsUeskUwmBXzJm4wsU+WFn6Wag
 W96s9p8ZC6/ujsaYUgzlm2GBwmXf9Av/bDpZN0cixZGUD939g6gdGgNyUtiIp7WH0Jwl
 PwpLvshkxjucOHcGD+d3vFfsVrVry7qH2CjM4iFzpdFfQuigKjtmx+jLVLZCmbZQa+WQ
 VeSzj2/83jTazQD64GCTb8irUkjcD3yOmc2Wt6eB23RrhTadnO3CERYMn1i0aoq3b9il
 3Syr6Jp+uUDX6ZVwX6qtrVMELE7h1Mz70xbFPl/LStFpeFHBbHQVvmUjEJRjN2u7Osx/
 m91g==
X-Gm-Message-State: AOAM532lfVCnzogknGhD9ej4sDIBi1KPN4rAjpmO5spuM240qHvSvz80
 LyFDOv7RjP0F+JcqS3zPauhdEw==
X-Google-Smtp-Source: ABdhPJww3OcJB7DUBKiy2i0mly5gI424/+m0SydrH6X6qUeaswtb9n5QNJgOtfTQca6JE7155ci+qQ==
X-Received: by 2002:ae9:eb4e:: with SMTP id b75mr5637656qkg.266.1633019490158; 
 Thu, 30 Sep 2021 09:31:30 -0700 (PDT)
Received: from turing-police ([2601:5c0:c380:d61::359])
 by smtp.gmail.com with ESMTPSA id h8sm1619422qkk.11.2021.09.30.09.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 09:31:29 -0700 (PDT)
From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks"
 <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.10.0-pre 07/05/2021 with nmh-1.7+dev
To: Ruben Safir <ruben@mrbrklyn.com>
Subject: Re: ALSA kernel projects - for academic purposes
In-Reply-To: <20210929150715.GC15841@www2.mrbrklyn.com>
References: <CAHhAz+i=3NDuxK2rZZY6N18=OTbkna3VMVpx4nNgF0vyq3JmQA@mail.gmail.com>
 <324112.1632501120@turing-police>
 <CAHhAz+jNCd=cw-bohcoiAA2UhNZYSFLX07qEV-T2p+KAsVHhAQ@mail.gmail.com>
 <YU5QgPwYDB2XnaVP@geday> <20210929150715.GC15841@www2.mrbrklyn.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1633019487_58057P";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Thu, 30 Sep 2021 12:31:28 -0400
Message-ID: <70857.1633019488@turing-police>
Cc: Muni Sekhar <munisekharrms@gmail.com>,
 alsa-devel <alsa-devel@alsa-project.org>,
 kernelnewbies <kernelnewbies@kernelnewbies.org>, linux-sound@vger.kernel.org,
 Geraldo Nascimento <geraldogabriel@gmail.com>
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

--==_Exmh_1633019487_58057P
Content-Type: text/plain; charset=us-ascii

On Wed, 29 Sep 2021 11:07:15 -0400, Ruben Safir said:
> > such that when the patch(set) is finally accepted by the Linux
> > community and Linus Torvalds ultimately, you can write a paper about
> > it.
> They are not writing a paper for Linus.  They are writing it for their
> dean or mentor.

On the flip side, it's the rare professor who knows enough about the Linux
kernel to assign reasonable projects.  If we had a dollar for every time that
we saw a prof assign "hijack a system call" or "read/write a file from inside
the kernel".....


--==_Exmh_1633019487_58057P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQEcBAEBCAAGBQJhVeZfAAoJEI0DS38y7CIcYYoH/j+cBQNkbznXtqA6gQyVAT/m
qJEGEBAbladPpnMq+fYNZ0cOOoF81uzBr1iMVc6SPfiZi/GO7EYPi9/MjCWUhXlv
uzLpmRI0E2MFC5HWlKXNBU3KebQuu5W3RrAtGZlwZflRK04rJmd94OwHpSTi8IUN
jJOYdOLxg4+hOdeqBiU67nLakfV6ru5vlBjquYDU3WyGbnyhfXRzHk5z+v/cdYsk
1UIg42UEdvosNyu/5RcHZo9InXJWWBNuK/N/v3WEEduuzGw1PGV9LID9xlJEXBiZ
VLxCHNwRpu46SDoN42T8nIaiHaQEcmS2JNUqHLpwTIj6Q3BSgrNfRf3R+WBQ9k0=
=0ynd
-----END PGP SIGNATURE-----

--==_Exmh_1633019487_58057P--
