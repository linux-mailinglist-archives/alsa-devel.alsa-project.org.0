Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A54391B309F
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 21:46:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46E5E16D1;
	Tue, 21 Apr 2020 21:46:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46E5E16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587498414;
	bh=Z39V1m4aEiUlUYdGW9pjoyiuYsVE2bjp9xVdA5Z6yHY=;
	h=Date:From:Subject:To:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=unHYXSnnXck52e4yXjx/P8lm/P3EWn8iGTuz1E/u2kXqgBztajzoGmDvlFnZ5ByVB
	 QA9Spjkh0mV+4I4t4swH7U96EmR3WuD7WKDLK4XxIC/gnGtdN/5O/VpOBxboshPoQP
	 2uM5FO/4Q4FMZbozraR+hja+CnYAysE3PTLbWi78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B85FDF801EC;
	Tue, 21 Apr 2020 21:44:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAAC1F801EC; Tue, 21 Apr 2020 21:09:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from sonic312-24.consmr.mail.gq1.yahoo.com
 (sonic312-24.consmr.mail.gq1.yahoo.com [98.137.69.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26154F800E7
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 21:09:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26154F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.ca header.i=@yahoo.ca
 header.b="saIdr/zj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1587496145; bh=7IsaXBRwEnsILs+9tSjAQ2TQvhkivr7QMUQHKvns9Dw=;
 h=Date:From:Subject:To:Cc:References:From:Subject;
 b=saIdr/zjgqK+2XHpUu9rHGUZXzBRktJ/Qu7/6PE9LH1idcm6YJarxPFbvuly4hEyWAWcj30MRMSwMNkmDpwhaZkidg2c5ZPF6ExWZXjS4c+8ybnBFCebirbNZVf4b6TVVNPb3fN4Vr6znm6MoD1exQa1nSGEioAj4dH5FUAph1VO40aLL5ygk6FGHQ2DeE9IxrtIs9aJ4njqEt7kDD5sAcEhDrFmhs1d9/4n6Le92KFsqHC6jH0Vc0yxr8IaBRr7RH/QPoO+sd/Y/J0HWTEfCSBTnVlkQwetBYAOU2pQEJn2EHuauq687eWGRfU3swpxYBZi2yKoSoSL36NcSeHang==
X-YMail-OSG: JuqRaH0VM1lpi9u7UAX2OLjABxNaIjDeKw7QMdbYD7HzPtFeIb1pvea7E2rDRt6
 U6oQ7RUaA3d_cz0Cp4utionL9yq1NEgELWYrp8d4KrX3fATe_PI9w5WmR5Yb0.zmL8.m.KqQig5a
 qLfA0pjXSev6g7HIIOkkn0MWpRD0Z53II7zoA5trYpsxhtgxPmR5HBL.4SlwnYqmksMc5LImWlIo
 444OSujYf6dlbZoQZHivbonO0LOJjFPqR11b.l675drJIsJ5b5IpUZPDW5oBsNu0HX4f79jBe7Ta
 qQandLft4FovLB4UcZdpC0TanfeyUWabzAvxAQW9kXmnH0dXGOOYxGGbmOK13AXi4w00sItN7Bi.
 WDLxMnhrq_sQFQjick_odb9Atyh7xroh2iFsHSr1zZ27G_QE6LVLGZ9mTu2aZAA6egRLm1X7sFxv
 txMU4MMfBESjWSV3lm93CBgwa8UPSEuAl77_wamORjh3xKxV8Lnwx4XhDZAYIIW9BXt9DbDHp5qs
 4LiUjtM.oBameWOiy7ijLSGypJ_nwMFF5ECgr4YAkR3WRIA2n8lyEZmvH1qL1ASEl4R_DZs143LG
 jGZRCwhMJh_8WBJ1hzRyFvv6FFWjhbaYwhOu3wbr60Qcbqq1tCKDiD3VFO3wytb8hp_tBKr.Ik2g
 DZdhETd68ihJ34nx0ZF7wmfARBG8gmrtz9KBSMHvUUa6cqFV6wJ0EgK8Nz_zMx_Pf.K.XhpI8ll1
 Izxi3CB1RkS5wYXbs3NeWFF7AHz_BDeXxY3y_vKC5wczm0wVu7OK8ip48CdjU3HPQq4tkSn8Pc_i
 TsgXG.RPyELqtnhvnBRBwlT.r.gCvA1KMLVfVzys2YbSYZR5GSmNsdsNESx8j3zEpYbj5_mMniRS
 YGtGY.pgvcym_61SngzbTSsWQ0jo2MxgGAq.aRssNJt1k17Y0TfOeAqlhYZWxjX66tLk8KnDY2BM
 wBaXTSdxKcWcExzRSBIEAeU6DnkWY.esQMmUVLVCnZ0c_BJj79aQJLbElS0x9r9eUn96LGuRG8BF
 dssM_Pda_HJFi0ajCE751pGrtDqP1J5.BwgVqeugOI4kKkVn2jA.SjmAr0JYt9IhfpGVAFFFP_LT
 zAOnQG8orpK3s3bcRufoZXwJxSVaCYm2a3sUyEt8WoFdwSQAOklHCN1yLFUWWmTqQ0bimFlp4icn
 RttMQiZBYbvXMCirfFWYj1.BQ.PnMCvl3cgWkbRpV7i.H9HdDxKOXeE1oio50Qh1lVOJh97PBiIe
 oKqb7M1grUNdwIuJht67AzAknuW4WMsnNpKejLixh0amz1cYys13g1aYLHOQw6mpJ9vXqR8x1tj4
 ardvPcUrdQgFHU3o.WT9Eo6KmdNUfI3KO4_Y2F9B0LuBmUex4IeaRC79F83c7iOrxv3ImGqIgnFe
 BT5a7
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Tue, 21 Apr 2020 19:09:05 +0000
Received: by smtp404.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 05f4ac1bcfb5b2e9473b08cea4a3e14a; 
 Tue, 21 Apr 2020 19:09:00 +0000 (UTC)
Date: Tue, 21 Apr 2020 15:08:44 -0400
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Unrecoverable AER error when resuming from RAM (hda regression in
 5.7-rc2)
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
MIME-Version: 1.0
Message-Id: <1587494585.7pihgq0z3i.none@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
References: <1587494585.7pihgq0z3i.none.ref@localhost>
X-Mailer: WebService/1.1.15739 hermes Apache-HttpAsyncClient/4.1.4
 (Java/11.0.6)
X-Mailman-Approved-At: Tue, 21 Apr 2020 21:44:24 +0200
Cc: linux-pci@vger.kernel.org, Roy Spliet <nouveau@spliet.org>,
 linux-kernel@vger.kernel.org
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

With 5.7-rc2, after resuming from suspend to RAM, I get:

[   55.679382] pcieport 0000:00:03.1: AER: Multiple Uncorrected (Non-Fatal)=
 error received: 0000:00:00.0
[   55.679405] pcieport 0000:00:03.1: AER: PCIe Bus Error: severity=3DUncor=
rected (Non-Fatal), type=3DTransaction Layer, (Requester ID)
[   55.679410] pcieport 0000:00:03.1: AER:   device [1022:1453] error statu=
s/mask=3D00100000/04400000
[   55.679414] pcieport 0000:00:03.1: AER:    [20] UnsupReq               (=
First)
[   55.679417] pcieport 0000:00:03.1: AER:   TLP Header: 40000004 0a0000ff =
fffc0e80 00000000
[   55.679423] amdgpu 0000:0a:00.0: AER: can't recover (no error_detected c=
allback)
[   55.679425] snd_hda_intel 0000:0a:00.1: AER: can't recover (no error_det=
ected callback)
[   55.679455] pcieport 0000:00:03.1: AER: device recovery failed

Then the display freezes and the system basically falls apart (can't=20
even sudo reboot -f, need to use magic sysrq).

I bisected this to "ALSA: hda: Skip controller resume if not needed".=20
Setting snd_hda_intel.power_save=3D0 resolves the issue.

I am using an ASRock B450 Pro4 with Realtek HDA codec:

[    1.009400] snd_hda_intel 0000:0a:00.1: enabling device (0000 -> 0002)
[    1.009425] snd_hda_intel 0000:0a:00.1: Force to non-snoop mode
[    1.009653] snd_hda_intel 0000:0c:00.3: enabling device (0000 -> 0002)
[    1.021452] snd_hda_codec_generic hdaudioC0D0: ignore pin 0x7, too many =
assigned pins
[    1.021461] snd_hda_codec_generic hdaudioC0D0: ignore pin 0x9, too many =
assigned pins
[    1.021471] snd_hda_codec_generic hdaudioC0D0: ignore pin 0xb, too many =
assigned pins
[    1.021480] snd_hda_codec_generic hdaudioC0D0: ignore pin 0xd, too many =
assigned pins
[    1.021482] snd_hda_codec_generic hdaudioC0D0: autoconfig for Generic: l=
ine_outs=3D0 (0x0/0x0/0x0/0x0/0x0) type:line
[    1.021482] snd_hda_codec_generic hdaudioC0D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[    1.021483] snd_hda_codec_generic hdaudioC0D0:    hp_outs=3D0 (0x0/0x0/0=
x0/0x0/0x0)
[    1.021484] snd_hda_codec_generic hdaudioC0D0:    mono: mono_out=3D0x0
[    1.021484] snd_hda_codec_generic hdaudioC0D0:    dig-out=3D0x3/0x5
[    1.021485] snd_hda_codec_generic hdaudioC0D0:    inputs:
[    1.046053] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC892: li=
ne_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:line
[    1.046054] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[    1.046055] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=3D1 (0x1b/0x0/=
0x0/0x0/0x0)
[    1.046055] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=3D0x0
[    1.046056] snd_hda_codec_realtek hdaudioC1D0:    inputs:
[    1.046057] snd_hda_codec_realtek hdaudioC1D0:      Front Mic=3D0x19
[    1.046058] snd_hda_codec_realtek hdaudioC1D0:      Rear Mic=3D0x18
[    1.046058] snd_hda_codec_realtek hdaudioC1D0:      Line=3D0x1a

I also have an ASUS RX 480 graphics card with HDMI audio output.
