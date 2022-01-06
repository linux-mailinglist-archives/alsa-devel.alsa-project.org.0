Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37999486485
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 13:43:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC35C1902;
	Thu,  6 Jan 2022 13:42:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC35C1902
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641472984;
	bh=LotRBLbKIaT2cq1py77HT4aylym5EGz4bxaDCKTQlds=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B1ewNTR4O6Dz5T/pOXbILkpX4SarcEsUKVaPUDIkAPnqOWAbU05BfXvhSYPG3MScD
	 WQXpe/Aj5peqvSj2S+uT6I3mfr7leKZRZPHAgICT7aoZ89gGOyVMg6seF2GsDAPkDg
	 PSERnYeV+jGnHOckkCcbeURbIi0UE9IzBTXRX+d0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 259C6F80158;
	Thu,  6 Jan 2022 13:41:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E40A5F800BB; Thu,  6 Jan 2022 13:41:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C03AFF800BB
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 13:41:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C03AFF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="jv+Y278R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641472909;
 bh=LotRBLbKIaT2cq1py77HT4aylym5EGz4bxaDCKTQlds=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=jv+Y278RWATQYL5kDB3z7tMDBQL8BAlLVGfokGYFW2Y4eChJRCOSbaBs4WUZajZSm
 bmUpySiNMF5lrljoiSMAf5Xok1mRL65AU2BFtoPqOZVYUifWDhzewITI9WEzBCLWgS
 UNKj2qW0idGgG4COAyOmmVlGowbp/ZMttKsg9iJM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from wave.lan ([95.91.248.70]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4JmN-1n5j4O0o0v-000Jj5; Thu, 06
 Jan 2022 13:41:49 +0100
From: Stefan Sauer <st_kost@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: seq: virmidi: Add a drain operation
Date: Thu,  6 Jan 2022 13:41:45 +0100
Message-Id: <20220106124145.17254-1-st_kost@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hTw/pX0BEWdyjKPQcAaPTRylFtVBYkEwLQQaO9j2F++egiI/HX2
 tvuj4R+MqebYI9vknkjN4j3lX6juPWXP6pVo69YTrIYgQVU2ytfqnEqFAfhjvWNgCHElsZN
 jvesCZYi+WB4m3s/Toj0GjIDVcbrRAGgq4e1AYbuBDAs1CJaGdm2up/2uOZRbjFyIBckqQI
 +y98YPIJn0MrHbjLcOmiA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+g8pMnpKPos=:crazdNO6UIMF9p+4hzVMcy
 Yer0h0+k5bS4yvN5DJpd+6E1hbP3KHmXwo6zSICbJqFC2jXNJFGtwDoAnsIhTNWo9L5WRHCXj
 ILGua4QsLnAmc2IUUkWan2BW4ku93rNVBASWBTGRONkvID0GmUkq80pjJ8d1g1VucqwpjI3Nv
 5AzumqvO13AUDw4sCD3YO1D6NbLoCBwXJtNo+4mbLhNLrCr+R8GuXJzkOJskDloG0VozjVBwm
 66rWtElnD8ZLplBqsy/dlT1FF0uiaIF0jglawmMX/QbWoR0GepbP5jtw9iHCemGB2oBsHxsrM
 S8HWi61IqGx3g0iOoEihtmz2ksv7SsW3n+V2f/KrHuwuLh+rmJSFIJ3bQYmUsu/lGumwBJPhf
 Q2UOpaVKXzPX4/YxzG8d2XqW7aY0r/IzHq/XV09oBseU/XjlHz3yZp7H3/SRJcN38y+F7+L2S
 g9+Xr9c2liQjyf8GDVcXHUMJxNvKC0c7QC10QP7fMirNj/aSIJj/iMfLC3N8Q6bhDrAM4p2P0
 ggfYUQPuSjJEd02yj/KbtNaQhCxE39h7OCPjNQX/k6y8YiVz9cio7WcaI9G0RD7fs7c5E9b5G
 QXI5hh52Ii81BD+mgfW3haCCJktcQTArGeYS6nEoN/vGFSMjfa/AWIuPU0igsg330HWTbs0ld
 wgFSOVPRbLhp3Cxtmqhya73f2sNe/QeywNKvhYVb3En7fSRG6Kz7GK1L9JBL/9h/immyIT6sc
 d03BTzxZwVw9lgfCdxAv3kkbY1cVkMzD/02bcSTTWoFF48Y1p4gk/cERWja+tPLuXWsP8o5OV
 OO5DDJalFp2Hnu4rWEA0FoN989M/E6D0RauyJhBVZ7vGSjrCR5kBotyjQ+av2ZpdkCrADsyv5
 1QZGmnUgcrfMesrcKIEPvRhZ7NA3qCJ+GbDPjto6XYoDMLWe4c3IAW54LnbZo4eKGsXApLjK7
 5/vUPKSXhjIrz4GEFoLyWAIetZD7ZY1YLj0yJqGcROGK4BZC368MWq/AOVdy7qMc/OWK2BhCP
 UUwyWwufQ8lORVTjBUNSf1ha/hv9hKgW2D92o8h7YBnFYF/9RB0spp6WNZc/3vWLtmVi+2t5k
 xsewfR4SvLNq90=
Cc: Stefan Sauer <st_kost@gmx.de>
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

If a driver does not supply a drain operation for outputs, a default code
path will execute msleep(50). Especially for a virtual midi device
this severely limmits the throughput.

This implementation for the virtual midi driver simply flushes the output
workqueue.

Signed-off-by: Stefan Sauer <st_kost@gmx.de>
=2D--
 sound/core/seq/seq_virmidi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/core/seq/seq_virmidi.c b/sound/core/seq/seq_virmidi.c
index 4abc38c70cae..f5cae49500c8 100644
=2D-- a/sound/core/seq/seq_virmidi.c
+++ b/sound/core/seq/seq_virmidi.c
@@ -262,6 +262,16 @@ static int snd_virmidi_output_close(struct snd_rawmid=
i_substream *substream)
 	return 0;
 }

+/*
+ * drain output work queue
+ */
+static void snd_virmidi_output_drain(struct snd_rawmidi_substream *substr=
eam)
+{
+	struct snd_virmidi *vmidi =3D substream->runtime->private_data;
+
+	flush_work(&vmidi->output_work);
+}
+
 /*
  * subscribe callback - allow output to rawmidi device
  */
@@ -336,6 +346,7 @@ static const struct snd_rawmidi_ops snd_virmidi_output=
_ops =3D {
 	.open =3D snd_virmidi_output_open,
 	.close =3D snd_virmidi_output_close,
 	.trigger =3D snd_virmidi_output_trigger,
+	.drain =3D snd_virmidi_output_drain,
 };

 /*
=2D-
2.34.1

