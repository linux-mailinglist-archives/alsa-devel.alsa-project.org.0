Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C6E29825E
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Oct 2020 16:45:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42F60170A;
	Sun, 25 Oct 2020 16:44:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42F60170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603640746;
	bh=XCXrRYBBP6Acev4ejdA7qalA9qWXcXzBfD4mmK0jKss=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=na7CWUZ2oJSFzvnnyofGwbreubt1CJmelGksZ6AGlf6Aa3EAxT0PMhdzDOieBhKCr
	 eJmKGBZjh3QGyHpy07csYMt+T0n2BEU2K8lRorpsGk/BAbynELeo6EBhl7SYUQS5bj
	 pAXrTxaZVP7ZnEfQCbpLJ5hzQxOczvMWFhKw8pSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52C01F800B9;
	Sun, 25 Oct 2020 16:44:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B3EBF800B9; Sun, 25 Oct 2020 16:44:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.cccmz.de (mail.cccmz.de [IPv6:2a01:4f8:161:4283:1000::108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 291DBF800C8
 for <alsa-devel@alsa-project.org>; Sun, 25 Oct 2020 16:44:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 291DBF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cccmz.de header.i=@cccmz.de
 header.b="OjGrgCul"
Received: from tanjeffs-laptop.fritz.box (x4db3a568.dyn.telefonica.de
 [77.179.165.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: tanjeff@cccmz.de)
 by mail.cccmz.de (Postfix) with ESMTPSA id A81E417A0BFC;
 Sun, 25 Oct 2020 16:43:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cccmz.de; s=2019;
 t=1603640639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=+MLEIbjbr+M0YvxzbANBftpIZmCHs7QCHvMiFQgCczY=;
 b=OjGrgCulA5jOGQ79n9m0R86ohemk24oColh/DPpA2cCZgvGg9zZyOaAmhluTyLji0nR4ff
 ZgXhwX3QX2nCvWJU4vpGk1EUhIvo7Ftzb8li5EvGYTIcQ6abhCEkm3UkrMaEywRpBo1FCU
 f63L2GcnMSKuA+fpw11INQngc4banzo=
From: "Tanjeff-N. Moos" <tanjeff@cccmz.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] control: Add documentation for snd_ctl_card_* and friends.
Date: Sun, 25 Oct 2020 16:43:40 +0100
Message-Id: <20201025154341.15875-1-tanjeff@cccmz.de>
X-Mailer: git-send-email 2.17.1
Cc: Takashi Iwai <tiwai@suse.de>, "Tanjeff-N. Moos" <tanjeff@cccmz.de>
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

In this patch series, I added a description about control interface
handling and how control interfaces are identified.

In addition, I added/improved Doxygen documentation for the
snd_ctl_card_info_t type and related corresponding functions,
e.g. snd_ctl_card_info(). I also documented other card-related like
snd_card_next().

Along the way I did minor documentation improvements.

Signed-off-by: Tanjeff-N. Moos <tanjeff@cccmz.de>
---
 include/control.h     |  40 +++++++++-
 src/control/cards.c   |  56 +++++++++-----
 src/control/control.c | 175 +++++++++++++++++++++++++++++++-----------
 3 files changed, 202 insertions(+), 69 deletions(-)

diff --git a/include/control.h b/include/control.h
index 8766f440..e1a0da47 100644
--- a/include/control.h
+++ b/include/control.h
@@ -50,7 +50,32 @@ typedef struct snd_aes_iec958 {
 	unsigned char dig_subframe[4];	/**< AES/IEC958 subframe bits */
 } snd_aes_iec958_t;
 
-/** CTL card info container */
+/** \brief CTL card info container.
+ *
+ * This type contains meta information about a sound card, such as the index,
+ * name, longname, etc.
+ *
+ * \par Memory management
+ *
+ * Before using a snd_ctl_card_info_t object, it must be allocated using
+ * snd_ctl_card_info_alloca() or snd_ctl_card_info_malloc(). When using the
+ * latter, it must be freed again using snd_ctl_card_info_free().
+ *
+ * A card info object can be zeroed out using snd_ctl_card_info_clear().
+ *
+ * A card info object can be copied to another one using
+ * snd_ctl_card_info_copy().
+ *
+ * \par Obtaining the Information
+ *
+ * To obtain the card information, it must first be opened using
+ * snd_ctl_open(), and a snd_ctl_card_info_t container must be
+ * allocated. Then, the information can be read using
+ * snd_ctl_card_info_get_card().
+ *
+ * Thereafter, the card properties can be read using the
+ * snd_ctl_card_info_get_*() functions.
+ */
 typedef struct _snd_ctl_card_info snd_ctl_card_info_t;
 
 /** CTL element identifier container */
@@ -438,11 +463,20 @@ void snd_ctl_elem_id_set_name(snd_ctl_elem_id_t *obj, const char *val);
 void snd_ctl_elem_id_set_index(snd_ctl_elem_id_t *obj, unsigned int val);
 
 size_t snd_ctl_card_info_sizeof(void);
+
 /** \hideinitializer
- * \brief allocate an invalid #snd_ctl_card_info_t using standard alloca
- * \param ptr returned pointer
+ * \brief Allocate an invalid #snd_ctl_card_info_t on the stack.
+ *
+ * Allocate space for a card info object on the stack. The allocated
+ * memory need not be freed, because it is on the stack.
+ *
+ * See snd_ctl_card_info_t for details.
+ *
+ * \param ptr Pointer to a snd_ctl_elem_value_t pointer. The address
+ *            of the allocated space will returned here.
  */
 #define snd_ctl_card_info_alloca(ptr) __snd_alloca(ptr, snd_ctl_card_info)
+
 int snd_ctl_card_info_malloc(snd_ctl_card_info_t **ptr);
 void snd_ctl_card_info_free(snd_ctl_card_info_t *obj);
 void snd_ctl_card_info_clear(snd_ctl_card_info_t *obj);
diff --git a/src/control/cards.c b/src/control/cards.c
index e57457c2..8226c42d 100644
--- a/src/control/cards.c
+++ b/src/control/cards.c
@@ -77,8 +77,8 @@ static int snd_card_load1(int card)
 
 /**
  * \brief Try to load the driver for a card.
- * \param card Card number.
- * \return 1 if driver is present, zero if driver is not present
+ * \param card Card index.
+ * \return 1 if driver is present, zero if driver is not present.
  */
 int snd_card_load(int card)
 {
@@ -86,14 +86,24 @@ int snd_card_load(int card)
 }
 
 /**
- * \brief Try to determine the next card.
- * \param rcard pointer to card number
- * \result zero if success, otherwise a negative error code
+ * \brief Iterate over physical sound cards.
+ *
+ * This function takes the index of a physical sound card and sets it to the
+ * index of the next card. If index is -1, it is set to the index of the first
+ * card. After the last card, the index is set to -1.
+ *
+ * For example, if you have 2 sound cards (with index 0 and 1), the index will
+ * be modified as follows:
+ *
+ * - -1 --> 0
+ * - 0 --> 1
+ * - 1 --> -1
+ *
+ * This does not work for virtual sound cards.
  *
- * Tries to determine the next card from given card number.
- * If card number is -1, then the first available card is
- * returned. If the result card number is -1, no more cards
- * are available.
+ * \param rcard Index of current card. The index of the next card is stored
+ *        here.
+ * \result zero if success, otherwise a negative error code.
  */
 int snd_card_next(int *rcard)
 {
@@ -114,13 +124,18 @@ int snd_card_next(int *rcard)
 }
 
 /**
- * \brief Convert card string to an integer value.
- * \param string String containing card identifier
- * \return zero if success, otherwise a negative error code
+ * \brief Convert a card string to the card index.
  *
- * The accepted format is an integer value in ASCII representation
- * or the card identifier (the id parameter for sound-card drivers).
- * The control device name like /dev/snd/controlC0 is accepted, too.
+ * This works only for physical sound cards, not for virtual cards.
+ *
+ * \param string A string identifying the card.
+ * \return The index of the card. On error, a a negative error code
+ *         is returned.
+ *
+ * The accepted formats for "string" are:
+ * - The index of the card (as listed in /proc/asound/cards), given as string
+ * - The ID of the card (as listed in /proc/asound/cards)
+ * - The control device name (like /dev/snd/controlC0)
  */
 int snd_card_get_index(const char *string)
 {
@@ -163,8 +178,9 @@ int snd_card_get_index(const char *string)
 
 /**
  * \brief Obtain the card name.
- * \param card Card number
- * \param name Result - card name corresponding to card number
+ *
+ * \param card The index of the card.
+ * \param name Result - card name corresponding to card index.
  * \result zero if success, otherwise a negative error code
  *
  * The value returned in name is allocated with strdup and should be
@@ -193,9 +209,9 @@ int snd_card_get_name(int card, char **name)
 
 /**
  * \brief Obtain the card long name.
- * \param card Card number
- * \param name Result - card long name corresponding to card number
- * \result zero if success, otherwise a negative error code
+ * \param card Index of the card.
+ * \param name Result - card long name corresponding to card index.
+ * \result Zero if success, otherwise a negative error code.
  *
  * The value returned in name is allocated with strdup and should be
  * freed when no longer used.
diff --git a/src/control/control.c b/src/control/control.c
index 08058c06..7abf8ee3 100644
--- a/src/control/control.c
+++ b/src/control/control.c
@@ -33,8 +33,50 @@
 <P>Control interface is designed to access primitive controls. There is
 also an interface for notifying about control and structure changes.
 
+
 \section control_general_overview General overview
 
+In Alsa, there are physical sound cards, such as USB headsets, and
+virtual sound cards, such as "pulse", which represents the PulseAudio
+Sound system. Each sound card offers a control interface, making its
+settings (e.g. volume knobs) available. The complete list of available
+control interfaces can be obtained using snd_device_name_hint(),
+giving -1 as card index and "ctl" as interface type. Each returned
+NAME hint identifies a control interface.
+
+Sound cards have an ID (a string), an index (an int, sometimes called
+the "card number"), a name, a longname, a mixername and a "components"
+property. The file /proc/asound/cards lists most of these properties
+for physical sound cards. Virtual sound cards are not listed in that
+file. The format is:
+
+\verbatim
+index [ID     ] Driver - name
+                longname
+\endverbatim
+
+Note that the mixername and components are not listed.
+
+
+\subsection control_cards_id Identifying and Opening Control Interfaces
+
+To work with a control interface, is must be opened first, using
+snd_ctl_open(). This function takes the interface name.
+
+For physical sound cards, the control interface can be identified
+using the string "hw:<index>" (e.g. `hw:2`). The NAME hint - which is
+"hw:CARD=<ID>" - can also be used. Further, its device file (something
+like `/dev/snd/controlC0`) is also acceptable. Either of them can be
+given to snd_ctl_open().
+
+For virtual sound cards, the NAME hint is given to snd_ctl_open().
+
+The functions snd_card_get_index(), snd_card_get_name() and
+snd_card_get_longname() can be used to find an identifying property
+when another one is already known.
+
+\section control_elements Elements
+
 In ALSA control feature, each sound card can have control elements. The elements
 are managed according to below model.
 
@@ -65,7 +107,7 @@ are managed according to below model.
      of userspace applications and drivers in kernel.
 
 
-\section identifying_elements Identifying Elements
+\subsection identifying_elements Identifying Elements
 
 Each element has the following identifying properties:
 
@@ -84,7 +126,7 @@ rare). The numid can change on each boot. In case of an USB sound
 card, the numid can also change when it is reconnected.
 
 
-\section element_lists Element Lists
+\subsection element_lists Element Lists
 
 An element list can be used to obtain a list of all elements of the
 sound card. The list contains generic information (e.g. how many
@@ -93,7 +135,7 @@ elements the card has), and the identifying properties of the elements
 element lists.
 
 
-\section working_with_elements Working with Elements
+\subsection working_with_elements Working with Elements
 
 It is possible to obtain information about an element using the
 snd_ctl_elem_info_*() functions. For enums, the allowed values can be
@@ -108,7 +150,7 @@ actual values or settings. It is also possible to get and set the ID
 values (such as the numid or the name).
 
 
-\section element_sets Element Sets
+\subsection element_sets Element Sets
 
 The type of element set is one of integer, integer64, boolean, enumerators,
 bytes and IEC958 structure. This indicates the type of value for each member in
@@ -328,10 +370,15 @@ int snd_ctl_subscribe_events(snd_ctl_t *ctl, int subscribe)
 
 
 /**
- * \brief Get card related information
- * \param ctl CTL handle
- * \param info Card info pointer
- * \return 0 on success otherwise a negative error code
+ * \brief Get information about the sound card.
+ *
+ * Obtain information about the sound card previously opened using
+ * snd_ctl_open(). The object "info" must be allocated prior to calling this
+ * function. See snd_ctl_card_info_t for details.
+ *
+ * \param ctl The CTL handle.
+ * \param info The card information is stored here. 
+ * \return 0 on success, otherwise a negative error code.
  */
 int snd_ctl_card_info(snd_ctl_t *ctl, snd_ctl_card_info_t *info)
 {
@@ -1477,11 +1524,13 @@ static int snd_ctl_open_noupdate(snd_ctl_t **ctlp, snd_config_t *root, const cha
 }
 
 /**
- * \brief Opens a CTL
- * \param ctlp Returned CTL handle
- * \param name ASCII identifier of the CTL handle
- * \param mode Open mode (see #SND_CTL_NONBLOCK, #SND_CTL_ASYNC)
- * \return 0 on success otherwise a negative error code
+ * \brief Opens a sound card.
+ *
+ * \param ctlp Returned CTL handle.
+ * \param name A string identifying the card (See \ref control_cards_id).
+ * \param mode Open mode (see #SND_CTL_NONBLOCK, #SND_CTL_ASYNC).
+ *
+ * \return 0 on success otherwise a negative error code.
  */
 int snd_ctl_open(snd_ctl_t **ctlp, const char *name, int mode)
 {
@@ -1925,8 +1974,8 @@ void snd_ctl_elem_id_set_index(snd_ctl_elem_id_t *obj, unsigned int val)
 }
 
 /**
- * \brief get size of #snd_ctl_card_info_t
- * \return size in bytes
+ * \brief get size of #snd_ctl_card_info_t.
+ * \return Size in bytes.
  */
 size_t snd_ctl_card_info_sizeof()
 {
@@ -1934,9 +1983,16 @@ size_t snd_ctl_card_info_sizeof()
 }
 
 /**
- * \brief allocate an invalid #snd_ctl_card_info_t using standard malloc
- * \param ptr returned pointer
- * \return 0 on success otherwise negative error code
+ * \brief Allocate an invalid #snd_ctl_card_info_t on the heap.
+ *
+ * Allocate space for a card info object on the heap. The allocated memory
+ * must be freed using snd_ctl_card_info_free().
+ *
+ * See snd_ctl_card_info_t for details.
+ *
+ * \param ptr Pointer to a snd_ctl_card_info_t pointer. The address
+ *            of the allocated space will be returned here.
+ * \return 0 on success, otherwise a negative error code.
  */
 int snd_ctl_card_info_malloc(snd_ctl_card_info_t **ptr)
 {
@@ -1948,8 +2004,10 @@ int snd_ctl_card_info_malloc(snd_ctl_card_info_t **ptr)
 }
 
 /**
- * \brief frees a previously allocated #snd_ctl_card_info_t
- * \param obj pointer to object to free
+ * \brief Free an #snd_ctl_card_info_t previously allocated using
+ *        snd_ctl_card_info_malloc().
+ *
+ * \param obj Pointer to the snd_ctl_card_info_t.
  */
 void snd_ctl_card_info_free(snd_ctl_card_info_t *obj)
 {
@@ -1957,8 +2015,11 @@ void snd_ctl_card_info_free(snd_ctl_card_info_t *obj)
 }
 
 /**
- * \brief clear given #snd_ctl_card_info_t object
- * \param obj pointer to object to clear
+ * \brief Clear given card info object.
+ *
+ * See snd_ctl_elem_value_t for details.
+ *
+ * \param obj Card info object.
  */
 void snd_ctl_card_info_clear(snd_ctl_card_info_t *obj)
 {
@@ -1966,9 +2027,10 @@ void snd_ctl_card_info_clear(snd_ctl_card_info_t *obj)
 }
 
 /**
- * \brief copy one #snd_ctl_card_info_t to another
- * \param dst pointer to destination
- * \param src pointer to source
+ * \brief Bitwise copy of a #snd_ctl_card_info_t object.
+ *
+ * \param dst Pointer to destination.
+ * \param src Pointer to source.
  */
 void snd_ctl_card_info_copy(snd_ctl_card_info_t *dst, const snd_ctl_card_info_t *src)
 {
@@ -1977,9 +2039,12 @@ void snd_ctl_card_info_copy(snd_ctl_card_info_t *dst, const snd_ctl_card_info_t
 }
 
 /**
- * \brief Get card number from a CTL card info
- * \param obj CTL card info
- * \return card number
+ * \brief Get the sound card index from the given info object.
+ *
+ * See snd_ctl_card_info_t for more details.
+ *
+ * \param obj The card info object.
+ * \return Sound card index.
  */
 int snd_ctl_card_info_get_card(const snd_ctl_card_info_t *obj)
 {
@@ -1988,9 +2053,12 @@ int snd_ctl_card_info_get_card(const snd_ctl_card_info_t *obj)
 }
 
 /**
- * \brief Get card identifier from a CTL card info
- * \param obj CTL card info
- * \return card identifier
+ * \brief Get the sound card ID from the given info object.
+ *
+ * See snd_ctl_card_info_t for more details.
+ *
+ * \param obj The card info object.
+ * \return Sound card ID.
  */
 const char *snd_ctl_card_info_get_id(const snd_ctl_card_info_t *obj)
 {
@@ -1999,9 +2067,12 @@ const char *snd_ctl_card_info_get_id(const snd_ctl_card_info_t *obj)
 }
 
 /**
- * \brief Get card driver name from a CTL card info
- * \param obj CTL card info
- * \return card driver name
+ * \brief Get the sound card driver from the given info object.
+ *
+ * See snd_ctl_card_info_t for more details.
+ *
+ * \param obj The card info object.
+ * \return The sound card driver.
  */
 const char *snd_ctl_card_info_get_driver(const snd_ctl_card_info_t *obj)
 {
@@ -2010,9 +2081,12 @@ const char *snd_ctl_card_info_get_driver(const snd_ctl_card_info_t *obj)
 }
 
 /**
- * \brief Get card name from a CTL card info
- * \param obj CTL card info
- * \return card name
+ * \brief Get the sound card name from the given info object.
+ *
+ * See snd_ctl_card_info_t for more details.
+ *
+ * \param obj The card info object.
+ * \return Sound card name.
  */
 const char *snd_ctl_card_info_get_name(const snd_ctl_card_info_t *obj)
 {
@@ -2021,9 +2095,12 @@ const char *snd_ctl_card_info_get_name(const snd_ctl_card_info_t *obj)
 }
 
 /**
- * \brief Get card long name from a CTL card info
- * \param obj CTL card info
- * \return card long name
+ * \brief Get the sound cards long name from the given info object.
+ *
+ * See snd_ctl_card_info_t for more details.
+ *
+ * \param obj The card info object.
+ * \return Sound cards long name.
  */
 const char *snd_ctl_card_info_get_longname(const snd_ctl_card_info_t *obj)
 {
@@ -2032,9 +2109,12 @@ const char *snd_ctl_card_info_get_longname(const snd_ctl_card_info_t *obj)
 }
 
 /**
- * \brief Get card mixer name from a CTL card info
- * \param obj CTL card info
- * \return card mixer name
+ * \brief Get the sound card mixer name from the given info object.
+ *
+ * See snd_ctl_card_info_t for more details.
+ *
+ * \param obj The card info object.
+ * \return Sound card mixer name.
  */
 const char *snd_ctl_card_info_get_mixername(const snd_ctl_card_info_t *obj)
 {
@@ -2043,9 +2123,12 @@ const char *snd_ctl_card_info_get_mixername(const snd_ctl_card_info_t *obj)
 }
 
 /**
- * \brief Get card component list from a CTL card info
- * \param obj CTL card info
- * \return card mixer identifier
+ * \brief Get the sound cards "components" property from the given info object.
+ *
+ * See snd_ctl_card_info_t for more details.
+ *
+ * \param obj The card info object.
+ * \return Sound cards "components" property.
  */
 const char *snd_ctl_card_info_get_components(const snd_ctl_card_info_t *obj)
 {
-- 
2.17.1

