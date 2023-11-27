Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D754802C34
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 08:40:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83CC8843;
	Mon,  4 Dec 2023 08:39:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83CC8843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701675597;
	bh=UGCe4Y1WSHODr3gT3jgxkMd5HYyfaETeqMR6wOf72+U=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=L4M4Xc3eu+cxpL985F37kdAnFgBJQPdYyXwlTDsCrbKeUbedbqEPjCbx8z2ronyZs
	 UVx1SGK/4oZXZUeR6rm7gCsR7Cx9POBOiBco06ts95JHUJi1l59gOye/TO4Mk1VHxv
	 1zF66hMlwdvpgVxulYvftgg91ulLk1xXch9KNstQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1D16F8057B; Mon,  4 Dec 2023 08:39:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 058B1F8057F;
	Mon,  4 Dec 2023 08:39:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAF5CF801D5; Mon, 27 Nov 2023 22:13:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6215BF8016E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 22:12:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6215BF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TBAaov25
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-7c43d42e2ceso1075233241.3
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Nov 2023 13:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701119561; x=1701724361;
 darn=alsa-project.org;
        h=message-id:mime-version:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yccPFesP7p0920kJMS/E5JhRCuVjCAmRtkM85ZpWd2w=;
        b=TBAaov253XcPJQ4dADCneh0hc9yGT1/ynJl+mOTRm+IRklh8H/lFHtQQ4LnH86n1MC
         hsMEKluQ+L2H4tUw3XWN9eI79UqoCR90pSoFjm+q/444VE7FtnXyCIaOXmfj5c4QW+pm
         nBEtXbkWB7/6KsXsiOg8BECnpjRN5HPPB8GFNlScUnO6k1JfJNcdyYO5Pvitw+i3EcaQ
         5lWdumU1pN5X9Z5D2FoYexoXMj9YnoPtq2hw+ofeCZvMC9N/vUcr7xfNMq3s7XWfEDnF
         MOpVq1+nfQvzbmn742tm+6izEVWC9SrrZd1DUM4Pt5+19LmyFLSO7O8QPdCq65YntrmK
         OCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701119561; x=1701724361;
        h=message-id:mime-version:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yccPFesP7p0920kJMS/E5JhRCuVjCAmRtkM85ZpWd2w=;
        b=Lx6zecNFny0ZcIMxxiL0ClPYMARAPBmJOXSMbShRNJcKK3XyhgZk0h/T0NTPfIHtAL
         MQW/6BQr4GqTFCmJe7AhnGgtdMSZ39i//4R7jJVHWQqMsyFzJGiRUc2chPy6rsLhZcUH
         vCk8tfjMbZbl9Om/xOFftdcxwsXSBshIny1MCZaz8jDd8LEH1HkUOCK6Pd3JGq+kpjQQ
         Xm7Hb1CcMSSVOiTntPWuM3//Qb/0bB5a2/nL2ibpGJvqqTlVtr0zRCD95ZF8Dl8+83Ey
         H38NOBSY05uP+B1g5tMSqCGnaOQOgXree9iAEvjXpjOO+sF/+Wwf7CFhMyYGds/0QRtg
         JPNA==
X-Gm-Message-State: AOJu0Yzm/6TiYKEDDVUS3n4B7bcZAGulez6rTXrm3EUKAcgeBlfZTtNq
	mGefqZPQxoTs6O/JUv1TSnE=
X-Google-Smtp-Source: 
 AGHT+IHnkCemysKXbDXummhibw7gB30Kl8r0EGcyxpspOvcqjYtHr7UjQbynKVgH0qt+kADnZGtVuQ==
X-Received: by 2002:a05:6122:a15:b0:4ac:a482:f0d8 with SMTP id
 21-20020a0561220a1500b004aca482f0d8mr9072230vkn.7.1701119560607;
        Mon, 27 Nov 2023 13:12:40 -0800 (PST)
Received: from localhost ([161.10.134.155])
        by smtp.gmail.com with ESMTPSA id
 bs12-20020a056122240c00b0049d28bbb8e8sm1774714vkb.32.2023.11.27.13.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 13:12:40 -0800 (PST)
Content-Type: multipart/mixed;
 boundary=1628d0f856a52f2855818cf04781135008f691eaa9bc3bd0cf6a40f5cb3f
Date: Mon, 27 Nov 2023 16:12:37 -0500
From: =?utf-8?q?Andr=C3=A9s_Pedraza?= <adpg.611@gmail.com>
To: <rf@opensource.cirrus.com>, <james.schulman@cirrus.com>,
 <david.rhodes@cirrus.com>
Cc: <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>
Subject: BUG hda/cs8904: Headphones not detected and no speaker sound after
 system suspend
MIME-Version: 1.0
Message-ID: 
 <CA+kJtouKztDJa38ikCY41SpLtZLHqyrg8UfMpK+GZn00=MfTFQ@mail.gmail.com>
X-MailFrom: adpg.611@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XJRDHG6EZMN4QHZSX4VLMNZTCRLYHTLZ
X-Message-ID-Hash: XJRDHG6EZMN4QHZSX4VLMNZTCRLYHTLZ
X-Mailman-Approved-At: Mon, 04 Dec 2023 07:34:33 +0000
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XJRDHG6EZMN4QHZSX4VLMNZTCRLYHTLZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--1628d0f856a52f2855818cf04781135008f691eaa9bc3bd0cf6a40f5cb3f
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Content-Type: text/plain; charset=UTF-8

Hello my dudes.

I've been having this bug for a few months now. Sound on my laptop works ju=
st
fine until the system suspends or I close the lid. If my headphones are
connected when I suspend the system, then there's no sound on headphones or
speakers on wake and PulseAudio claims there's never any headphones connect=
ed.
If my headphones aren't connected on suspend, then speakers work just fine,=
 but
headphones are still never detected and make no sound.

Additionally, I recently found out that after waking from suspend, if I run
`sudo dmesg | grep snd` I find two timeout warnings that weren't there befo=
re,
and more showing up as I keep running the command. They go:
> snd_hda_codec_cs8409 hdaudioC1D0: Timeout waiting for PDN_DONE for
> CS42L42

I'm on a Dell Vostro 3405 laptop, which I know has a Cirrus sound card. I
recently compiled and tested this bug on the Linux 6.6.2 stable kernel. No =
dice.
I attach the outputs of `pactl list sinks`, `sudo dmesg | grep snd` and `su=
do
lspci -v | grep snd -B 10`. Please do tell if the issue might be caused by =
some
other module or BIOS configuration, or if you need more data.

--1628d0f856a52f2855818cf04781135008f691eaa9bc3bd0cf6a40f5cb3f
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=dmesg_grep_snd.txt
Content-Type: text/plain; charset=utf-8; name=dmesg_grep_snd.txt

WyAgICA1Ljg4NTg5MF0gc25kX3BjaV9hY3AzeCAwMDAwOjA0OjAwLjU6IEFDUCBhdWRpbyBtb2Rl
IDogMgpbICAgIDYuMTk5MjYzXSBzbmRfaGRhX2ludGVsIDAwMDA6MDQ6MDAuMTogSGFuZGxlIHZn
YV9zd2l0Y2hlcm9vIGF1ZGlvIGNsaWVudApbICAgIDYuMjE5OTM2XSBzbmRfaGRhX2ludGVsIDAw
MDA6MDQ6MDAuMTogYm91bmQgMDAwMDowNDowMC4wIChvcHMgYW1kZ3B1X2RtX2F1ZGlvX2NvbXBv
bmVudF9iaW5kX29wcyBbYW1kZ3B1XSkKWyAgICA2LjI0NjQ0MV0gc25kX2hkYV9jb2RlY19jczg0
MDkgaGRhdWRpb0MxRDA6IGF1dG9jb25maWcgZm9yIENTODQwOTogbGluZV9vdXRzPTEgKDB4MmMv
MHgwLzB4MC8weDAvMHgwKSB0eXBlOnNwZWFrZXIKWyAgICA2LjI0NjQ1MV0gc25kX2hkYV9jb2Rl
Y19jczg0MDkgaGRhdWRpb0MxRDA6ICAgIHNwZWFrZXJfb3V0cz0wICgweDAvMHgwLzB4MC8weDAv
MHgwKQpbICAgIDYuMjQ2NDU3XSBzbmRfaGRhX2NvZGVjX2NzODQwOSBoZGF1ZGlvQzFEMDogICAg
aHBfb3V0cz0xICgweDI0LzB4MC8weDAvMHgwLzB4MCkKWyAgICA2LjI0NjQ2M10gc25kX2hkYV9j
b2RlY19jczg0MDkgaGRhdWRpb0MxRDA6ICAgIG1vbm86IG1vbm9fb3V0PTB4MApbICAgIDYuMjQ2
NDY2XSBzbmRfaGRhX2NvZGVjX2NzODQwOSBoZGF1ZGlvQzFEMDogICAgaW5wdXRzOgpbICAgIDYu
MjQ2NDY5XSBzbmRfaGRhX2NvZGVjX2NzODQwOSBoZGF1ZGlvQzFEMDogICAgICBJbnRlcm5hbCBN
aWM9MHg0NApbICAgIDYuMjQ2NDczXSBzbmRfaGRhX2NvZGVjX2NzODQwOSBoZGF1ZGlvQzFEMDog
ICAgICBNaWM9MHgzNApbICAyNjQuMjkwNzk0XSBzbmRfaGRhX2NvZGVjX2NzODQwOSBoZGF1ZGlv
QzFEMDogVGltZW91dCB3YWl0aW5nIGZvciBQRE5fRE9ORSBmb3IgQ1M0Mkw0MgpbICAyNjcuNDk1
MzM2XSBzbmRfaGRhX2NvZGVjX2NzODQwOSBoZGF1ZGlvQzFEMDogVGltZW91dCB3YWl0aW5nIGZv
ciBQRE5fRE9ORSBmb3IgQ1M0Mkw0MgpbICAzMTcuODY3MzAyXSBzbmRfaGRhX2NvZGVjX2NzODQw
OSBoZGF1ZGlvQzFEMDogVGltZW91dCB3YWl0aW5nIGZvciBQRE5fRE9ORSBmb3IgQ1M0Mkw0Mgpb
ICAzNTAuMDIzNDIyXSBzbmRfaGRhX2NvZGVjX2NzODQwOSBoZGF1ZGlvQzFEMDogVGltZW91dCB3
YWl0aW5nIGZvciBQRE5fRE9ORSBmb3IgQ1M0Mkw0MgpbICA3ODYuMzE0MDQ2XSBzbmRfaGRhX2Nv
ZGVjX2NzODQwOSBoZGF1ZGlvQzFEMDogVGltZW91dCB3YWl0aW5nIGZvciBQRE5fRE9ORSBmb3Ig
Q1M0Mkw0Mgo=
--1628d0f856a52f2855818cf04781135008f691eaa9bc3bd0cf6a40f5cb3f
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=lspci_grep_snd.txt
Content-Type: text/plain; charset=utf-8; name=lspci_grep_snd.txt

CjA0OjAwLjEgQXVkaW8gZGV2aWNlOiBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuIFtBTUQv
QVRJXSBSYXZlbi9SYXZlbjIvRmVuZ2h1YW5nIEhETUkvRFAgQXVkaW8gQ29udHJvbGxlcgoJU3Vi
c3lzdGVtOiBEZWxsIFJhdmVuL1JhdmVuMi9GZW5naHVhbmcgSERNSS9EUCBBdWRpbyBDb250cm9s
bGVyCglGbGFnczogYnVzIG1hc3RlciwgZmFzdCBkZXZzZWwsIGxhdGVuY3kgMCwgSVJRIDY3LCBJ
T01NVSBncm91cCAxMgoJTWVtb3J5IGF0IGMwNmM4MDAwICgzMi1iaXQsIG5vbi1wcmVmZXRjaGFi
bGUpIFtzaXplPTE2S10KCUNhcGFiaWxpdGllczogWzQ4XSBWZW5kb3IgU3BlY2lmaWMgSW5mb3Jt
YXRpb246IExlbj0wOCA8Pz4KCUNhcGFiaWxpdGllczogWzUwXSBQb3dlciBNYW5hZ2VtZW50IHZl
cnNpb24gMwoJQ2FwYWJpbGl0aWVzOiBbNjRdIEV4cHJlc3MgTGVnYWN5IEVuZHBvaW50LCBNU0kg
MDAKCUNhcGFiaWxpdGllczogW2EwXSBNU0k6IEVuYWJsZSsgQ291bnQ9MS8xIE1hc2thYmxlLSA2
NGJpdCsKCUNhcGFiaWxpdGllczogWzEwMF0gVmVuZG9yIFNwZWNpZmljIEluZm9ybWF0aW9uOiBJ
RD0wMDAxIFJldj0xIExlbj0wMTAgPD8+CglLZXJuZWwgZHJpdmVyIGluIHVzZTogc25kX2hkYV9p
bnRlbAoJS2VybmVsIG1vZHVsZXM6IHNuZF9oZGFfaW50ZWwKLS0KCjA0OjAwLjUgTXVsdGltZWRp
YSBjb250cm9sbGVyOiBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuIFtBTURdIEFDUC9BQ1Az
WC9BQ1A2eCBBdWRpbyBDb3Byb2Nlc3NvcgoJU3Vic3lzdGVtOiBEZWxsIEFDUC9BQ1AzWC9BQ1A2
eCBBdWRpbyBDb3Byb2Nlc3NvcgoJRmxhZ3M6IGJ1cyBtYXN0ZXIsIGZhc3QgZGV2c2VsLCBsYXRl
bmN5IDAsIElSUSA2MiwgSU9NTVUgZ3JvdXAgMTIKCU1lbW9yeSBhdCBjMDY4MDAwMCAoMzItYml0
LCBub24tcHJlZmV0Y2hhYmxlKSBbc2l6ZT0yNTZLXQoJQ2FwYWJpbGl0aWVzOiBbNDhdIFZlbmRv
ciBTcGVjaWZpYyBJbmZvcm1hdGlvbjogTGVuPTA4IDw/PgoJQ2FwYWJpbGl0aWVzOiBbNTBdIFBv
d2VyIE1hbmFnZW1lbnQgdmVyc2lvbiAzCglDYXBhYmlsaXRpZXM6IFs2NF0gRXhwcmVzcyBFbmRw
b2ludCwgTVNJIDAwCglDYXBhYmlsaXRpZXM6IFthMF0gTVNJOiBFbmFibGUtIENvdW50PTEvMSBN
YXNrYWJsZS0gNjRiaXQrCglDYXBhYmlsaXRpZXM6IFsxMDBdIFZlbmRvciBTcGVjaWZpYyBJbmZv
cm1hdGlvbjogSUQ9MDAwMSBSZXY9MSBMZW49MDEwIDw/PgoJS2VybmVsIGRyaXZlciBpbiB1c2U6
IHNuZF9wY2lfYWNwM3gKCUtlcm5lbCBtb2R1bGVzOiBzbmRfcGNpX2FjcDN4LCBzbmRfcm5fcGNp
X2FjcDN4LCBzbmRfcGNpX2FjcDV4LCBzbmRfcGNpX2FjcDZ4CgowNDowMC42IEF1ZGlvIGRldmlj
ZTogQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLiBbQU1EXSBGYW1pbHkgMTdoLzE5aCBIRCBB
dWRpbyBDb250cm9sbGVyCglTdWJzeXN0ZW06IERlbGwgRmFtaWx5IDE3aC8xOWggSEQgQXVkaW8g
Q29udHJvbGxlcgoJRmxhZ3M6IGJ1cyBtYXN0ZXIsIGZhc3QgZGV2c2VsLCBsYXRlbmN5IDAsIElS
USA0MywgSU9NTVUgZ3JvdXAgMTIKCU1lbW9yeSBhdCBjMDZjMDAwMCAoMzItYml0LCBub24tcHJl
ZmV0Y2hhYmxlKSBbc2l6ZT0zMktdCglDYXBhYmlsaXRpZXM6IFs0OF0gVmVuZG9yIFNwZWNpZmlj
IEluZm9ybWF0aW9uOiBMZW49MDggPD8+CglDYXBhYmlsaXRpZXM6IFs1MF0gUG93ZXIgTWFuYWdl
bWVudCB2ZXJzaW9uIDMKCUNhcGFiaWxpdGllczogWzY0XSBFeHByZXNzIEVuZHBvaW50LCBNU0kg
MDAKCUNhcGFiaWxpdGllczogW2EwXSBNU0k6IEVuYWJsZSsgQ291bnQ9MS8xIE1hc2thYmxlLSA2
NGJpdCsKCUNhcGFiaWxpdGllczogWzEwMF0gVmVuZG9yIFNwZWNpZmljIEluZm9ybWF0aW9uOiBJ
RD0wMDAxIFJldj0xIExlbj0wMTAgPD8+CglLZXJuZWwgZHJpdmVyIGluIHVzZTogc25kX2hkYV9p
bnRlbAoJS2VybmVsIG1vZHVsZXM6IHNuZF9oZGFfaW50ZWwK
--1628d0f856a52f2855818cf04781135008f691eaa9bc3bd0cf6a40f5cb3f
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=pactl_list_sinks.txt
Content-Type: text/plain; charset=utf-8; name=pactl_list_sinks.txt

U2luayAjNTAKCVN0YXRlOiBTVVNQRU5ERUQKCU5hbWU6IGFsc2Ffb3V0cHV0LnBjaS0wMDAwXzA0
XzAwLjYuYW5hbG9nLXN0ZXJlbwoJRGVzY3JpcHRpb246IEZhbWlseSAxN2gvMTloIEhEIEF1ZGlv
IENvbnRyb2xsZXIgRXN0w6lyZW8gYW5hbMOzZ2ljbwoJRHJpdmVyOiBQaXBlV2lyZQoJU2FtcGxl
IFNwZWNpZmljYXRpb246IHMzMmxlIDJjaCA0ODAwMEh6CglDaGFubmVsIE1hcDogZnJvbnQtbGVm
dCxmcm9udC1yaWdodAoJT3duZXIgTW9kdWxlOiA0Mjk0OTY3Mjk1CglNdXRlOiBubwoJVm9sdW1l
OiBmcm9udC1sZWZ0OiAyNjI5MSAvICA0MCUgLyAtMjMsODAgZEIsICAgZnJvbnQtcmlnaHQ6IDI2
MjkxIC8gIDQwJSAvIC0yMyw4MCBkQgoJICAgICAgICBiYWxhbmNlIDAsMDAKCUJhc2UgVm9sdW1l
OiA2NTUzNiAvIDEwMCUgLyAwLDAwIGRCCglNb25pdG9yIFNvdXJjZTogYWxzYV9vdXRwdXQucGNp
LTAwMDBfMDRfMDAuNi5hbmFsb2ctc3RlcmVvLm1vbml0b3IKCUxhdGVuY3k6IDAgdXNlYywgY29u
ZmlndXJlZCAwIHVzZWMKCUZsYWdzOiBIQVJEV0FSRSBIV19NVVRFX0NUUkwgSFdfVk9MVU1FX0NU
UkwgREVDSUJFTF9WT0xVTUUgTEFURU5DWSAKCVByb3BlcnRpZXM6CgkJYWxzYS5jYXJkID0gIjEi
CgkJYWxzYS5jYXJkX25hbWUgPSAiSEQtQXVkaW8gR2VuZXJpYyIKCQlhbHNhLmNsYXNzID0gImdl
bmVyaWMiCgkJYWxzYS5kZXZpY2UgPSAiMCIKCQlhbHNhLmRyaXZlcl9uYW1lID0gInNuZF9oZGFf
aW50ZWwiCgkJYWxzYS5pZCA9ICJDUzg0MDkvQ1M0Mkw0MiBBbmFsb2ciCgkJYWxzYS5sb25nX2Nh
cmRfbmFtZSA9ICJIRC1BdWRpbyBHZW5lcmljIGF0IDB4YzA2YzAwMDAgaXJxIDY3IgoJCWFsc2Eu
bmFtZSA9ICJDUzg0MDkvQ1M0Mkw0MiBBbmFsb2ciCgkJYWxzYS5yZXNvbHV0aW9uX2JpdHMgPSAi
MTYiCgkJYWxzYS5zdWJjbGFzcyA9ICJnZW5lcmljLW1peCIKCQlhbHNhLnN1YmRldmljZSA9ICIw
IgoJCWFsc2Euc3ViZGV2aWNlX25hbWUgPSAic3ViZGV2aWNlICMwIgoJCWFwaS5hbHNhLmNhcmQu
bG9uZ25hbWUgPSAiSEQtQXVkaW8gR2VuZXJpYyBhdCAweGMwNmMwMDAwIGlycSA2NyIKCQlhcGku
YWxzYS5jYXJkLm5hbWUgPSAiSEQtQXVkaW8gR2VuZXJpYyIKCQlhcGkuYWxzYS5wYXRoID0gImZy
b250OjEiCgkJYXBpLmFsc2EucGNtLmNhcmQgPSAiMSIKCQlhcGkuYWxzYS5wY20uc3RyZWFtID0g
InBsYXliYWNrIgoJCWF1ZGlvLmNoYW5uZWxzID0gIjIiCgkJYXVkaW8ucG9zaXRpb24gPSAiRkws
RlIiCgkJY2FyZC5wcm9maWxlLmRldmljZSA9ICIzIgoJCWRldmljZS5hcGkgPSAiYWxzYSIKCQlk
ZXZpY2UuY2xhc3MgPSAic291bmQiCgkJZGV2aWNlLmlkID0gIjQzIgoJCWRldmljZS5wcm9maWxl
LmRlc2NyaXB0aW9uID0gIkVzdMOpcmVvIGFuYWzDs2dpY28iCgkJZGV2aWNlLnByb2ZpbGUubmFt
ZSA9ICJhbmFsb2ctc3RlcmVvIgoJCWRldmljZS5yb3V0ZXMgPSAiMiIKCQlmYWN0b3J5Lm5hbWUg
PSAiYXBpLmFsc2EucGNtLnNpbmsiCgkJbWVkaWEuY2xhc3MgPSAiQXVkaW8vU2luayIKCQlkZXZp
Y2UuZGVzY3JpcHRpb24gPSAiRmFtaWx5IDE3aC8xOWggSEQgQXVkaW8gQ29udHJvbGxlciIKCQlu
b2RlLm5hbWUgPSAiYWxzYV9vdXRwdXQucGNpLTAwMDBfMDRfMDAuNi5hbmFsb2ctc3RlcmVvIgoJ
CW5vZGUubmljayA9ICJDUzg0MDkvQ1M0Mkw0MiBBbmFsb2ciCgkJbm9kZS5wYXVzZS1vbi1pZGxl
ID0gImZhbHNlIgoJCW9iamVjdC5wYXRoID0gImFsc2E6cGNtOjE6ZnJvbnQ6MTpwbGF5YmFjayIK
CQlwcmlvcml0eS5kcml2ZXIgPSAiMTAwOSIKCQlwcmlvcml0eS5zZXNzaW9uID0gIjEwMDkiCgkJ
ZmFjdG9yeS5pZCA9ICIxOCIKCQljbG9jay5xdWFudHVtLWxpbWl0ID0gIjgxOTIiCgkJY2xpZW50
LmlkID0gIjM0IgoJCW5vZGUuZHJpdmVyID0gInRydWUiCgkJZmFjdG9yeS5tb2RlID0gIm1lcmdl
IgoJCWF1ZGlvLmFkYXB0LmZvbGxvd2VyID0gIiIKCQlsaWJyYXJ5Lm5hbWUgPSAiYXVkaW9jb252
ZXJ0L2xpYnNwYS1hdWRpb2NvbnZlcnQiCgkJb2JqZWN0LmlkID0gIjUwIgoJCW9iamVjdC5zZXJp
YWwgPSAiNTAiCgkJbm9kZS5tYXgtbGF0ZW5jeSA9ICIxNjM4NC80ODAwMCIKCQlhcGkuYWxzYS5w
ZXJpb2Qtc2l6ZSA9ICIxMDI0IgoJCWFwaS5hbHNhLnBlcmlvZC1udW0gPSAiMzIiCgkJYXBpLmFs
c2EuaGVhZHJvb20gPSAiMCIKCQlhcGkuYWNwLmF1dG8tcG9ydCA9ICJmYWxzZSIKCQlhcGkuYWNw
LmF1dG8tcHJvZmlsZSA9ICJmYWxzZSIKCQlhcGkuYWxzYS5jYXJkID0gIjEiCgkJYXBpLmFsc2Eu
dXNlLWFjcCA9ICJ0cnVlIgoJCWFwaS5kYnVzLlJlc2VydmVEZXZpY2UxID0gIkF1ZGlvMSIKCQlk
ZXZpY2UuYnVzID0gInBjaSIKCQlkZXZpY2UuYnVzX3BhdGggPSAicGNpLTAwMDA6MDQ6MDAuNiIK
CQlkZXZpY2UuZW51bS5hcGkgPSAidWRldiIKCQlkZXZpY2UuaWNvbl9uYW1lID0gImF1ZGlvLWNh
cmQtYW5hbG9nLXBjaSIKCQlkZXZpY2UubmFtZSA9ICJhbHNhX2NhcmQucGNpLTAwMDBfMDRfMDAu
NiIKCQlkZXZpY2UubmljayA9ICJIRC1BdWRpbyBHZW5lcmljIgoJCWRldmljZS5wbHVnZ2VkLnVz
ZWMgPSAiNjYyMTU0NCIKCQlkZXZpY2UucHJvZHVjdC5pZCA9ICIweDE1ZTMiCgkJZGV2aWNlLnBy
b2R1Y3QubmFtZSA9ICJGYW1pbHkgMTdoLzE5aCBIRCBBdWRpbyBDb250cm9sbGVyIgoJCWRldmlj
ZS5zdWJzeXN0ZW0gPSAic291bmQiCgkJc3lzZnMucGF0aCA9ICIvZGV2aWNlcy9wY2kwMDAwOjAw
LzAwMDA6MDA6MDguMS8wMDAwOjA0OjAwLjYvc291bmQvY2FyZDEiCgkJZGV2aWNlLnZlbmRvci5p
ZCA9ICIweDEwMjIiCgkJZGV2aWNlLnZlbmRvci5uYW1lID0gIkFkdmFuY2VkIE1pY3JvIERldmlj
ZXMsIEluYy4gW0FNRF0iCgkJZGV2aWNlLnN0cmluZyA9ICIxIgoJUG9ydHM6CgkJYW5hbG9nLW91
dHB1dC1zcGVha2VyOiBBbHRhdm9jZXMgKHR5cGU6IFNwZWFrZXIsIHByaW9yaXR5OiAxMDAwMCwg
YXZhaWxhYmlsaXR5IGdyb3VwOiBMZWdhY3kgMywgYXZhaWxhYmlsaXR5IHVua25vd24pCgkJYW5h
bG9nLW91dHB1dC1oZWFkcGhvbmVzOiBBdXJpY3VsYXJlcyAodHlwZTogSGVhZHBob25lcywgcHJp
b3JpdHk6IDk5MDAsIGF2YWlsYWJpbGl0eSBncm91cDogTGVnYWN5IDQsIG5vdCBhdmFpbGFibGUp
CglBY3RpdmUgUG9ydDogYW5hbG9nLW91dHB1dC1zcGVha2VyCglGb3JtYXRzOgoJCXBjbQo=
--1628d0f856a52f2855818cf04781135008f691eaa9bc3bd0cf6a40f5cb3f--
