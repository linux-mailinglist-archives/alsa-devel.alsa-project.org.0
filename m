Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AB3822176
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 19:55:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20B3F14A9;
	Tue,  2 Jan 2024 19:55:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20B3F14A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704221722;
	bh=mAgkZ0XjZpLNWaVDZ72tld9/1gdaStOAdKvOuWK3O44=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=a7H7I2nSMCudQTvqDezhEXUfyWzXywwKXz7IzyuluyjxJkVUY5gMdlGu9lSBGnj/k
	 H3kNx2WcdRd3R30xAO9aj7Cs2uLmsLFAzwYYol5HO8mDH+xniy1u5LmXzOBFne6Wha
	 uHP6ZM1gsqkA+mjwpCl/Kr4JHxy8FG8FwFUV/6/E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D161F80858; Tue,  2 Jan 2024 19:51:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37BFDF80815;
	Tue,  2 Jan 2024 19:51:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9F39F80153; Thu, 21 Dec 2023 19:00:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B8F8F800BD
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 19:00:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B8F8F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JfnMUH9E
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-4b6c92fb29aso266033e0c.2
        for <alsa-devel@alsa-project.org>;
 Thu, 21 Dec 2023 10:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703181604; x=1703786404;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JatmGYwDwmzmQR014Qeoy0k41/Gm8DuknWQ/+zHq7O4=;
        b=JfnMUH9ErvXCDVdMrosmFisbJ2rO3Q3Z1Joam0PXnY/qmil1uP0FybrTDZ9lD2tYlB
         yICgr65nbH+LAsMyz6uyaJrLKVh/O1K51Tu/6ytjT7i4qAanwea0EhGANkewfHb22UTw
         WfHXlDhVAqZonfvY8TUG8QmTmwvNZplld+SeRUIoPbqqTtaffnvi6M+wf9mm7dXQVRBo
         3lrwCvStsz6dEZrS8ZL4eiso62VQS2YrJeir8FaNrrGb8Hx06k+SkjNaM48ZV9Zz+MiF
         ljNaPFYVIo2btrxX3ZvnaMNiw4rYSDeQbqZdEL207XK9vM7QD4IPFOefcGTY3y4Xwq7K
         9k6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703181604; x=1703786404;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JatmGYwDwmzmQR014Qeoy0k41/Gm8DuknWQ/+zHq7O4=;
        b=t9i9Bkoak7JxLsXdrbgqizGoCXPRLF1SiB13wG12plH+ydBOmyEl/rH7Z3l0VsEfOt
         jb68nkcDKh9SGPFF05Ub/4VXtwEB5vG9uDyD2HoBCF1bQfZpUTrfUE4gVolB9NS91zcC
         HgCJAcOlyZGnqDXHQ1lSXKQvD7GCr7CZVMiL3OnZuOgLvrB/Ivu0S/nrdoLT6c8SPhzu
         PZxYbAgOtzkevV0kVC2m90L+cMnS9cwyYwNcJoAjEviad2WX1lgA5PW4trmTOLjWYT8T
         EwLFnSbPfDoozMSiuEvEV6iqhQlHS+ZDdKalFjNitaCvR5S9biVc5mOheNGdD0L/VV4p
         DCgg==
X-Gm-Message-State: AOJu0Yw8QV2cIN55Ija5svieIhCTJU/7peGJWq19o/ZALlyB8WQpFESN
	k4FaY4pc7BBJ9rsaFfcEEFtmZv8Uqn/u0Cr575S7R1BBYraruA==
X-Google-Smtp-Source: 
 AGHT+IE2aLJs++6RAoF06MnVJMNRLh1jWQlwJUpaDku01PH+UtuS6BOtbepJRGxRBBBXIqZx/ULqS2qYQsnAFdmPABU=
X-Received: by 2002:ac5:cdd4:0:b0:4b6:c781:a97d with SMTP id
 u20-20020ac5cdd4000000b004b6c781a97dmr17986vkn.1.1703181604209; Thu, 21 Dec
 2023 10:00:04 -0800 (PST)
MIME-Version: 1.0
From: R Guerra <xbox360liveteam21@gmail.com>
Date: Thu, 21 Dec 2023 17:59:53 +0000
Message-ID: 
 <CAGTfBuhGbEXgSDfpwUoGo8wAV9Huh1nfN9o+j27hWG+85vzCkA@mail.gmail.com>
Subject: Re: Re: [PATCH] ALSA: hda/realtek: the bass speaker can't output
 sound on Yoga 9i
To: alsa-devel@alsa-project.org
X-MailFrom: xbox360liveteam21@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DB56E67NLA7NMDSE5SLICJRPDMEH7TSH
X-Message-ID-Hash: DB56E67NLA7NMDSE5SLICJRPDMEH7TSH
X-Mailman-Approved-At: Mon, 01 Jan 2024 13:18:25 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DB56E67NLA7NMDSE5SLICJRPDMEH7TSH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGVsbG8sIHNvcnJ5IHRvIGluY29udmVuaWVuY2UgeW91Lg0KDQpJJ20gaGF2aW5nIHRoZSBzYW1l
IHByb2JsZW0gd2l0aCB0aGUgYmFzcyBzcGVha2VycyBvbiBteSBuZXcgOWkgcHJvLg0KDQpEaWQg
eW91IG1hZGUgYW5vdGhlciBwb3N0IG9yIHNvbWV0aGluZyB0aGF0IGV4cGxhaW5zIGJldHRlciB3
aGF0IEkgbmVlZCB0bw0KZG8gdG8gZml4IHRoaXM/IEkgZGlkbid0IHJlYWx5IHVuZGVyc3RhbmQg
d2hhdCBJIG5lZWRlZCB0byBkbyAoaSdtIGxlYXJuaW5nDQpsaW51eCBub3cpDQoNClRoYW5rIHlv
dSBmb3IgeW91ciBhdHRlbnRpb24uDQo=
